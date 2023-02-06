#Declarar un proveedor de nube
provider "aws" {
  region = "us-east-1"
  profile="aws_icesi"
}

#Recursos declaraciones de componentes
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t1.micro"

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "backend" {
  ami = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    Name = "backend"
  }
}

resource "aws_instance" "db" {
  ami = "ami-00874d747dde814fa"
  instance_type = "t2.micro"

  tags = {
    Name = "db"
  }
}

#Consultas de datos (opcional)

#Inicializar: terraform init

#Verificar diseño: terraform plan

#Aplicar el diseño: terraform apply

#Destruir infraestructura: terraform destroy