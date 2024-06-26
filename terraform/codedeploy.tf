# resource "aws_codedeploy_app" "ecom-deploy" {
#   compute_platform = "ECS"
#   name             = "ecom-deploy"
# }

# resource "aws_codedeploy_deployment_group" "example" {
#   app_name               = aws_codedeploy_app.ecom-deploy.name
#   deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
#   deployment_group_name  = "ecom-deploy-gp"
#   service_role_arn       = "arn:aws:iam::211125373436:role/codedeploy-ecommerce_bussiness-service-role"

#   auto_rollback_configuration {
#     enabled = true
#     events  = ["DEPLOYMENT_FAILURE"]
#   }

#   blue_green_deployment_config {
#     deployment_ready_option {
#       action_on_timeout = "CONTINUE_DEPLOYMENT"
#     }

#     terminate_blue_instances_on_deployment_success {
#       action                           = "TERMINATE"
#       termination_wait_time_in_minutes = 5
#     }
#   }

#   deployment_style {
#     deployment_option = "WITH_TRAFFIC_CONTROL"
#     deployment_type   = "BLUE_GREEN"
#   }

#   ecs_service {
#     cluster_name = aws_ecs_cluster.main.name
#     service_name = aws_ecs_service.main.name
#   }

#   load_balancer_info {
#     target_group_pair_info {
#       prod_traffic_route {
#         listener_arns = [aws_lb_listener.ecom_listener.arn]
#       }

#       target_group {
#         name = aws_lb_target_group.ecom_ip-tg-blue.name
#       }

#       target_group {
#         name = aws_lb_target_group.ecom_ip-tg-green.name
#       }
#     }
#   }
# }