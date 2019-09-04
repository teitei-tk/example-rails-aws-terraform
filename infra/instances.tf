resource "aws_instance" "app" {
  ami                    = "ami-374db956"
  instance_type          = "t3.nano"
  key_name               = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = ["${aws_security_group.app.id}"]
  subnet_id              = "${aws_subnet.vpc-public-1a.id}"

  tags {
    Name = "App"
  }
}

resource "aws_key_pair" "auth" {
  key_name   = "example-rails-aws-terraform"
  public_key = "${file(var.ec2_public_keypair_path)}"
}
