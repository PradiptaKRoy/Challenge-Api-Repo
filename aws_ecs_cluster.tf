resource "aws_ecs_cluster" "challenge-api-ecs-cluster" {
  name = "ecs-cluster-for-challenge-api"
}

resource "aws_ecs_service" "demo-ecs-service-two" {
  name            = "challenge-api-app"
  cluster         = aws_ecs_cluster.challenge-api-ecs-cluster.id
  task_definition = aws_ecs_task_definition.challenge-api-ecs-task-definition.arn
  launch_type     = "FARGATE"
  network_configuration {
    
  subnets          = ["subnet-c37dfbe2"]
    assign_public_ip = true
  }
  desired_count = 1
}

resource "aws_ecs_task_definition" "challenge-api-ecs-task-definition" {
  family                   = "ecs-task-definition-challenge-api"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = "1024"
  cpu                      = "512"
  execution_role_arn       = "arn:aws:iam::550331656791:role/ecsTaskExecutionRole"
  container_definitions    = <<EOF
[
  {
    "name": "challenge-api-container",
    "image": "550331656791.dkr.ecr.us-east-1.amazonaws.com/challenge-api-repo:latest",
    "memory": 1024,
    "cpu": 512,
    "essential": true,
    "entryPoint": ["java","-jar","/application.jar"],
    "portMappings": [
      {
        "containerPort":8080,
        "hostPort":8080
      }
    ]
  }
]
EOF
}
