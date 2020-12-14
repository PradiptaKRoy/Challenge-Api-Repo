# Challenge-Api-Repo

Steps to Run:

1. Download the Github repository in your local computer.

2. Create an account in AWS - Free Tier. Login to the account. 
Goto--> User (on to the top Left Corner) --> My Security Credentials --> Access Keys (TAB) and click on "Create new Access Key" button. It will create access key and secret keys for you. Click "Show Access Key" to see and copy the Access Key and Secret Key. You should download it on to your computer.

3. Open the aws_credentials.tf file and put your access key and secret key.

4. Install Terraform and Docker in your local computer.

5. Execute the following Terraform command :

terraform init

terraform apply

This will create the project in aws.

To delete the project execute:

terraform delete

How to create and setup an SSH key 
Objective : Ensure that SSH server is configured in a such way that it will look for public parts of the SSH key both from .ssh/authorized_keys and .ssh/authorized_keys2 files

Open the ssh config file:

$ ee /etc/ssh/sshd_config
Edit/Add the following options as such:

RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2
Refresh the settings:

$ service sshd reload
Note: by doing reload instead of restart, the already connected ssh connections will stay connected and working

Generate and Add a random RSA key following the next steps:

Generate the 4096 bits rsa key:

$ ssh-keygen -t rsa -b 4096
Note: Generating public/private rsa key pair. can take few seconds

It will ask for the output name, but leave it empty and press ENTER:

Enter file in which to save the key (/root/.ssh/id_rsa):

It will ask for the passphrase: (min #pass>4 character length)

Enter passphrase (empty for no passphrase):

Enter same passphrase again:

Note: using a passphrase instead of leaving blank is highly suggested!

Now you have two files inside /root/.ssh: id_rsa and id_rsa.pub. Save both of them in your computer.

Note: you can ignored the printed key fingerprint and key's randomart image.

Add the public key in the authorized keys:

$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys2
_Note: ~ is the name of the current user. If root, it will be /root.

Now delete the generated keys: (after you saved a copy of them in your computer)

$ rm ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
Note: you don't need to refresh anything to enable and use the new key.

Note2: you can use any name instead of id_rsa.
