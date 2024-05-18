# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

data "aws_availability_zones" "availables_zones" {

}
#Create Key Pairs
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "inhabit_file_private" {
    content = tls_private_key.pk.private_key_pem
    filename = var.key_name_tag
  
}
resource "local_file" "inhabit_file_pub" {
    content = tls_private_key.pk.private_key_openssh
    filename = var.key_name_tag
  
}

#  resource "aws_key_pair" "inhabit_pub_key" {
#    key_name   = var.key_name_tag
#    public_key = tls_private_key.pk.public_key_openssh
#  }

  resource "aws_key_pair" "inhabit_pub_key" {
   key_name   = var.key_name_tag_pub
   public_key = tls_private_key.pk.public_key_openssh
 }
# Create Instance
resource "aws_instance" "damier_web_instance" {
  ami           = var.images
  instance_type = var.instance_type
 
  key_name        = aws_key_pair.inhabit_pub_key.key_name

subnet_id = aws_subnet.public_sub.id
vpc_security_group_ids = [aws_security_group.inhabit_allow_tls.id]

 
  tags = {
    Name = var.aws_instance_tag
  }

}

resource "null_resource" "commander" {

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.pk.private_key_pem
    host        = aws_instance.damier_web_instance.public_ip
  }

  provisioner "file" {
    source = "./build_agent.sh"
    destination = "/tmp/build_agent.sh"
    
  }

  provisioner "remote-exec" {
    inline = [  
        "pwd",
      "sudo chmod +x /tmp/build_agent.sh",
      "sh /tmp/build_agent.sh" ,
     

     ]
    
  }

  depends_on = [ aws_instance.damier_web_instance ]
  
}

# Create a Lock Id
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform_state_lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


 output "public_ip" {
   description = "Public IP of this Agent instance"
   value       = ["Custom Hostname: ${aws_instance.damier_web_instance.public_ip}"]
 }

output "available_zones" {
  description = "Get All Available zones available"
 
 value = [
    for zones in data.aws_availability_zones.availables_zones.names : zones
 ]
}

output "web_url" {

    value = join("",["${aws_instance.damier_web_instance.public_dns}",":", "8080"])
  
}

