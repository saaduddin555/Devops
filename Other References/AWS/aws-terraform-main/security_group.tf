#Create SG for lB, only TCP/80,TCP/443 and outbound access
resource "aws_security_group" "lb-sg" {
  name        = "lb-sg"
  provider    = aws.region-master
  description = "Allow 443 and traffic to Jenkins SG"
  vpc_id      = aws_vpc.vpc_master.id

  ingress {
    description = "Allow 443 from Anywhere"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow 80 from Anywhere"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#Create SG for allowing TCP/22 from your IP in us-west-2
resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  provider    = aws.region-master
  description = "Allow TCP/8080 and TCP/22"
  vpc_id      = aws_vpc.vpc_master.id
  ingress {
    description     = "Allow anyone on port 8080"
    from_port       = var.webserver-port
    protocol        = "tcp"
    to_port         = var.webserver-port
    security_groups = [aws_security_group.lb-sg.id]
  }
  ingress {
    description = "Allow 22 from our public IP"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.external_ip]
  }
  ingress {
    description = "Allow traffic from us-west-2 "
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["192.168.1.0/24"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#Create SG for allowing TCP/22 from your IP in us-west-2
resource "aws_security_group" "jenkins-sg-oregon" {
  name        = "jenkins-sg-oregon"
  provider    = aws.region-worker
  description = "Allow TCP/80 and TCP/22"
  vpc_id      = aws_vpc.vpc_master_oregon.id
  ingress {
    description = "Allow 22 from our public IP"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.external_ip]
  }
  ingress {
    description = "Allow traffic from us-east-1 "
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["10.0.1.0/24"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}