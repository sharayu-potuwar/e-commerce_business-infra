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
   image       = "211125373436.dkr.ecr.us-east-1.amazonaws.com/ecom_repo:ecom_app1`"
   essential   = true
   portMappings = [{
     protocol      = "tcp"
     containerPort = 8001
     hostPort      = 8001
  }]
}])
}