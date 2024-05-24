resource "aws_db_instance" "app" {
  allocated_storage    = 10
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "postgres_password"
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.alb.id]
  db_subnet_group_name = aws_db_subnet_group.main.name
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.public.id]
}