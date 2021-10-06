#RESOURSE LINE
# Avaliability Zone
# AWS USER
# VPC
# Instances
# Security Groups
# 
# Basic part
# more https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# Set credentials:
# Method 1
provider "aws" {
  # Credentials
  # 1. With AWS Cli and put it to
  # 			# See more
  # 			# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.htm
  # 			# windows
  # 			# C:\Users\User-name\.aws
  # 			#| - config
  # 			#|	- credentials

}

# Method 2
provider "aws" {
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
  region     = "AWS_REGION"
}

# Method 3
provider "aws" {
	# add credential to environment variables
	
	# #Linux
	# export AWS_REGION=region_name 
	# export AWS_ACCESS_KEY_ID=my_access_key
	# export AWS_SECRET_ACCESS_KEY=my_secret_key

	# #Windows
	# $env: AWS_DEFAULT_REGION=region_name
	# $env: AWS_ACCESS_KEY_ID=my_access_key
	# $env: AWS_SECRET_ACCESS_KEY=my_secret_key

	# #Looking all envi
	# export
	# #for clear view
	# env
}

/*==============================================================

#Create AWS instance
resource "aws_instance" "tf_ubuntu" {
  # create 3 identical instace
  # counts = 3
  # destroy instance
  # counts = 0 
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"

  tags = {
    # create visual name
    Name      = "tf_ubuntu_web"
    "owner"   = "krotek"
    "project" = "DevOps"
  }

}

resource "aws_instance" "tf_amazon" {
  ami           = "ami-0453cb7b5f2b7fca2"
  instance_type = "t2.micro"

  tags = {
    Name      = "tf_amazon_test"
    "owner"   = "krotek"
    "project" = "DevOps"
  }

}


#Create instance with Web Server
resource "aws_instance" "tf_simple_server" {
  ami           = "ami-0453cb7b5f2b7fca2"
  instance_type = "t2.micro"
	#If we have only 1 main user_data file
	# user_data 		= file("./user_data_folder/user_data.sh")
	#If we have dynamic user_data file
	user_data =  templatefile("./user_data_folder/user_data.sh.tpl", {
		f_name = "Mimi",
		l_name = "Colins",
		works = ["JS", "DevOps", "CybSec"]
	})

  
	#attach security group to instance
  vpc_security_group_ids = [aws_security_group.my_webserver_sg.id]

	#attach ssh-access
	key_name = aws_key_pair.aws_ssh_user.key_name



  tags = {
    Name = "tf_simple_Web_server"
  }

}



#Create Security Group
resource "aws_security_group" "my_webserver_sg" {
  name        = "WebServer Security Group"
  description = "Security Group for Web server"


  ingress {

    description = "Ports for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    description = "Ports for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = "WebServer Security Group Tags"
  }
}

#Create Security Group
#With Dynamic code
resource "aws_security_group" "Dev_access" {
	name = "Dev security group"
	description = "Secutiry group with dynamic settings"

	dynamic "ingress" {
		for_each = ["80", "443", "8080", "9090"]
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}
	}

	ingress {
		description = "ssh"
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

 
 	egress {
		from_port = 0
		to_port = 0
		protocol = -1
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Dynamic Dev Security Group"
	}
	
}


#Create SSH AWS_key_pair
resource "aws_key_pair" "aws_ssh_user" {
  key_name   = "aws_ssh_user"
  # public_key = "./ssh/aws_ssh_user.pub"
  public_key = "${file("${path.module}/ssh/aws_ssh_user.pub")}"
}



#Create Elastic IP
#Permanent IP adress for instance
resource "aws_eip" "web_server_static_ip" {
	instance = aws_instance.tf_web_server.id
	
}


#Create Web server
#with lifecycle
resource "aws_instance" "tf_web_server" {
	ami           = "ami-0453cb7b5f2b7fca2"
  instance_type = "t2.micro"
	
	user_data = templatefile("./user_data_folder/user_data.sh.tpl", {
		f_name = "Aleksander"
		l_name = "Extsand"
		works = ["Web", "JS" , "DevOps", "CybSec"]
	})
	vpc_security_group_ids = [aws_security_group.sg_web_server.id]
	tags = {
		Name = "Web_server_tf"
	}
	lifecycle {
		#protect without destroy instance
		# prevent_destroy = true

		#DEPRECATED in new Terraform
		#ignore changes with elements
		# ignore_changes = [
		# 	"ami", "user_data"
		# ]

		#ZeroDownTime
		#Recreating server without zerodowntime
		# create_before_destroy = true

	}

	#Dependense from security group
	#Create first - security group
	#Create second - aws instance
	#priority of creation
	# priority           1 - state                           2 -state
	# depends_on = [aws_security_group.sg_web_server, aws_instance.SOME_DATA_BASE]
	# and when we will start create THIS instance 

}

resource "aws_security_group" "sg_web_server" {
	name = "Web server security group"
	description = "Simple web SG"
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = -1
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "Web server security group"
	}
	
}


#Output information
#for observation
output "webserver_instance_id" {
	value = aws_instance.tf_web_server.id
}
output "webserver_public_ip_adress" {
	value = aws_eip.web_server_static_ip.public_ip
}
output "webserver_sg_id" {
	value = aws_security_group.sg_web_server.id
}




#====================================
#Create VPC
resource "aws_vpc" "test_vpc" {
	cidr_block = "10.10.0.0/16"
	tags = {
		Name = "Test_vpc"
	}
	
}

# # Create VPC subnet
# resource "aws_subnet" "prod_subnet_1" {
# 	# vpc_id = data.aws_vpc.current.id
# 	# vpc_id = data.aws_vpcs.show_all_vpc.ids[1]
# 	availability_zone = data.aws_availability_zones.working.names[0]
# 	cidr_block = "10.10.1.0/24"
# 	tags = {
# 		Name = "Subnet-1 in ${data.aws_availability_zones.working.names[0]}"
# 		Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
# 		Region = data.aws_region.current.description
# 	}
# }

# resource "aws_subnet" "prod_subnet_2" {
# 	vpc_id = data.aws_vpc.current.id
# 	availability_zone = data.aws_availability_zones.working.names[1]
# 	cidr_block = "10.10.2.0/24"
# 	tags = {
# 		Name = "Subnet-2 in ${data.aws_availability_zones.working.names[1]}"
# 		Account = "Subnet in Account ${data.aws_caller_identity.current.account_id}"
# 		Region = data.aws_region.current.description
# 	}
# }



#Data Sourse
# #get information from AWS
data "aws_availability_zones" "working" { }
output "data_aws_availability_zones" {
	value = data.aws_availability_zones.working
}

data "aws_caller_identity" "current" { }
output "data_aws_caller_identity" {
	value = data.aws_caller_identity.current
}


data "aws_region" "current"{ }
# output "data_aws_region" {
# 	value = data.aws_region.current
# }

#for single VPC
# data "aws_vpc" "current" {
# 	# manually add
# 	id = "vpc-0feba84f29563cc54"
# }
# output "data_aws_vpc" {
# 	value = data.aws_vpc.current
# }

# data "aws_vpcs" "show_all_vpc"{}
# output "show_vpcs" {
# 	value = data.aws_vpcs.show_all_vpc.ids
# }



#==========How to get all instances information about region?=========================
# data "aws_instances" "User_instances" {
# 	#  instance_tags = {
# 	# 	 Name = "Web"
# 	#  }
# }

# output "show_instances" {
# 	value = data.aws_instances.User_instances
# }



===================================================*/

