resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.aws_cluster_name}" 
  setting {
      name = "containerInsights"
      value = "enabled"
  }

  tags = {
    Name = "${var.app_name}-cluster"
  }
}

resource "aws_ecs_task_definition" "task-definition" {
  family                = "web-family"
  container_definitions = file("container-definitions/container-def-frankfurt-itm.json")
  #container_definitions = file("container-definitions/container-def-n-virginia.json")
  #container_definitions = file("container-definitions/container-def-frankfurt.json")
  network_mode          = "awsvpc"

  execution_role_arn       = aws_iam_role.iam-role.arn
  task_role_arn            = aws_iam_role.iam-role.arn

  tags = {
    Name        = "${var.app_name}-task-definition"
    Environment = var.app_environment
  }
}

resource "aws_ecs_service" "service" {
  name            = "${var.app_name}-ecs-service"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task-definition.family
  desired_count   = 1
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  
  launch_type = "EC2"
  scheduling_strategy = "REPLICA"
  
  network_configuration {
    subnets = aws_subnet.public.*.id
    assign_public_ip = false
    # security_groups = [
    #   #aws_security_group.service_security_group.id,
    #   aws_security_group.load_balancer_security_group.id
    # ]
  }
}

resource "aws_instance" "hello-world-app" {
  ami = "${var.instance_ami}"
  instance_type = "t2.micro"
  #availability_zone = "us-east-2"
  availability_zone = "${var.instance_availability_zone}"
  key_name = "${var.ssh_key_pair}"
 

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.network-interface.id
  }

  user_data = <<EOF
  #!/bin/bash
  echo ECS_CLUSTER=${aws_ecs_cluster.ecs-cluster.name} >> /etc/ecs/ecs.config
  EOF
    
  iam_instance_profile = aws_iam_instance_profile.iam-profile.name   
  
  tags = {
    Name = "${var.app_name}-instance"
  }
}