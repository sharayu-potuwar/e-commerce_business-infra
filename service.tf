resource "aws_ecs_service" "main" {
    name                               = "e-comm_ecs_service"
    cluster                            = aws_ecs_cluster.main.id
    task_definition                    = aws_ecs_task_definition.e-comm_ecs_task.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"

    network_configuration {
        security_groups  = "sg-0070f32bfa40490c2"
        subnets          = "subnet-005a5c83ac0837b4f"
        assign_public_ip = true
    }

    lifecycle {
        ignore_changes = [task_definition, desired_count]
    }
}