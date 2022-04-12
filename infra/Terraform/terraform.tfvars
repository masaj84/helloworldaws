#-------------------------FRANKFURT-----------------------------------
aws_region        = "eu-central-1"
instance_ami      = "ami-0dcc0ebde7b2e00db"
#ssh_key_pair      = "myTerraEC2Key"
ssh_key_pair      = "mm-key-pair" #ITM

instance_availability_zone = "eu-central-1a"
availability_zones = ["eu-central-1a", "eu-central-1b"]
public_subnets     = ["172.31.100.0/24", "172.31.101.0/24"] 
private_subnets    = ["172.31.0.0/24", "172.31.1.0/24"] 
vpc_cidr_block     = "172.31.0.0/16"

app_name        = "net-mm-app-frankfurt"
app_environment = "research"

# database_name     = "nodejsdatabase"
# database_password = "database-password"
# aws_access_key    = "aws_access_key"
# aws_secret_key    = "aws_secret_key"

#-------------------------N. VIRGINIA-----------------------------------
# aws_region        = "us-east-2"
# instance_ami      = "ami-0b9412c869f55216b"
# ssh_key_pair      = "myEC2KeyNVirginia"
# #ssh_key_pair      = "mm-key-pair" #ITM

# instance_availability_zone = "us-east-2a"
# availability_zones = ["us-east-2b"]
# public_subnets     = ["10.10.100.0/24", "10.10.101.0/24"] 
# private_subnets    = ["10.10.0.0/24", "10.10.1.0/24"] 
# vpc_cidr_block     = "10.10.0.0/16"

# app_name        = "dot-net-core-app-n-virginia"
# app_environment = "production"

# database_name     = "nodejsdatabase"
# database_password = "database-password"
# aws_access_key    = "aws_access_key"
# aws_secret_key    = "aws_secret_key"