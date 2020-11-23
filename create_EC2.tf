resource "aws_instance" "centos8" {
  ami           = "ami-01ca03df4a6012157"
  #count 	= 1
  instance_type = "t2.micro" 
  key_name  	= aws_key_pair.centos8_key.key_name
  security_groups=[aws_security_group.allow_http_ssh.name]
tags = {
    Name = "centos8_VM"
  }
  connection {
        type    = "ssh"
        user    = "centos"
        host    = aws_instance.centos8.public_ip
        port    = 22
        private_key = tls_private_key.centos8_private_key.private_key_pem
    }
  provisioner "remote-exec" {
        inline = [
         "curl -O https://staff.ambientia.fi/challenge-auditors/amb-user-henryh-1.0-2.noarch.rpm",
         "curl -O https://staff.ambientia.fi/challenge-auditors/amb-user-jussiha-1.0-4.noarch.rpm",
         "curl -O https://staff.ambientia.fi/challenge-auditors/amb-user-teroj-1.0-9.noarch.rpm",
         "curl -O https://staff.ambientia.fi/challenge-auditors/amb-user-veikkos-1.0-6.noarch.rpm",
         "sudo rpm -ivh *.rpm",
         "sudo sed --in-place 's/^#\\s*\\(%wheel\\s\\+ALL=(ALL)\\s\\+NOPASSWD:\\s\\+ALL\\)/\\1/' /etc/sudoers",
	]
    }
}
provider "docker" {

}
