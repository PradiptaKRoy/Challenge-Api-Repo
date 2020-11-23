ssh-keygen
cat ~/.ssh/id_rsa.pub | ssh -i "centos8_key.pem" centos@ec2-52-55-211-224.compute-1.amazonaws.com "sudo mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
