resource "null_resource" "nullremote"  {
depends_on = [  aws_volume_attachment.ebs_attachment,aws_cloudfront_distribution.s3_distribution
   ]
    connection {
        type    = "ssh"
        user    = "centos"
        host    = aws_instance.centos8.public_ip
        port    = 22
        private_key = tls_private_key.centos8_private_key.private_key_pem
    }
   provisioner "remote-exec" {
        inline  = [
     "sudo mkfs.ext4 /dev/xvdf",
     "sudo mkdir /var/Challenge_Ambientia
     "sudo mount /dev/xvdf /var/Challenge_Ambientia",
     "sudo git clone https://github.com/ambientiaoy/challenge-api.git  /var/Challenge_Ambientia/",
     "sudo su << EOF",
            "echo \"${aws_cloudfront_distribution.s3_distribution.domain_name}\" >> /tmp/Challenge_Ambientia/path.txt",
            "EOF",
]
    }
}
