resource "aws_iam_instance_profile" "iam-profile" {
    name = "${var.app_name}-profile"
    role = aws_iam_role.iam-role.name
}

resource "aws_iam_role" "iam-role" {
  name = "helloworld-iam-mm-role"
  path = "/"

  assume_role_policy = jsonencode(
  {
      "Version": "2012-10-17",
      "Statement":[
          {
              "Action": "sts:AssumeRole",
              "Principal": {
                  "Service": "ec2.amazonaws.com"
              },
              "Effect": "Allow",
              "Sid": ""
          }
      ]
  }) 
}


resource "aws_iam_role_policy_attachment" "iam-policy" {
  role       = aws_iam_role.iam-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}