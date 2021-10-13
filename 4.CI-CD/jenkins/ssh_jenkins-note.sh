ssh-keygen -t rsa -b 4096 PEM
ssh-copy-id -i ~/.ssh/id_rsa.pub user@192.168.100.1

ssh -T git@github.com
