resource "aws_ecs_cluster" "main" {
  name = "${var.env}_e-comm_cluster"
}

resource "aws_ecs_service" "main" {
    name                               = "${var.env}_e-comm_ecs_service"
    cluster                            = aws_ecs_cluster.main.id
    task_definition                    = aws_ecs_task_definition.e-comm_ecs_task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    network_configuration {
        security_groups  = ["sg-0070f32bfa40490c2"]
        subnets          = ["subnet-005a5c83ac0837b4f","subnet-0e82b9017f47c921a"]
        assign_public_ip = true
    }

    load_balancer {
    target_group_arn = aws_lb_target_group.ecom_ip-tg.arn
    container_name   = "ecom_container"
    container_port   = 8001
    }

    lifecycle {
        ignore_changes = [task_definition, desired_count]
    }
}

resource "aws_ecs_task_definition" "e-comm_ecs_task" {
  family = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
   name        = "ecom_container"
   image       = "211125373436.dkr.ecr.us-east-1.amazonaws.com/ecom_repo:latest"
   essential   = true
   portMappings = [{
     protocol      = "tcp"
     containerPort = 8001
     hostPort      = 8001
  }]
   "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "${aws_cloudwatch_log_group.ecom_watch_gp.name}",
                    "awslogs-region": "us-east-1",
                    "awslogs-stream-prefix": "ecomm"
                }
            }
}])
}