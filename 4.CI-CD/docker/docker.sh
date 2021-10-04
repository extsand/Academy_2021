#Install Docker
sudo apt update
sudo apt install apt-transport-https

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install docker.io

sudo systemctl status docker
sudo docker -v

# add user to docker group
sudo usermod -aG docker $USER


#Test docker
sudo docker run hello-world




