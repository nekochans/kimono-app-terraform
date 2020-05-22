resource "aws_ecs_cluster" "api" {
  name = var.ecs_cluster_name
}

data "template_file" "container_definitions" {
  template = file("${path.module}/task/container-definitions.json")

  vars = {
    aws_region     = data.aws_region.current.name
    ecr_api_url    = "${var.ecr_api_url}:latest"
    aws_logs_group = aws_cloudwatch_log_group.ecs_api.name
  }
}

resource "aws_ecs_task_definition" "api" {
  family                   = var.ecs_task_definition_name
  network_mode             = "awsvpc"
  container_definitions    = data.template_file.container_definitions.rendered
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.task_execution_role.arn

  depends_on = [aws_cloudwatch_log_group.ecs_api]
}

resource "aws_ecs_service" "api_fargate_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.api.id
  task_definition = aws_ecs_task_definition.api.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.api_blue.id
    container_name   = "go"
    container_port   = 8888
  }

  network_configuration {
    subnets = var.subnet_private_ids

    security_groups = [
      aws_security_group.ecs.id,
    ]
  }

  //  deployment_controller {
  //    type = "CODE_DEPLOY"
  //  }

  lifecycle {
    ignore_changes = [
      task_definition,
      load_balancer,
      desired_count,
    ]
  }

  depends_on = [aws_alb_listener.api]
}
