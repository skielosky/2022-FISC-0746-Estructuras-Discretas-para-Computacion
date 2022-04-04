#Update and upgrade all the installed packages
sudo apt update && sudo apt upgrade -y

#Add gns3 repo ant install the server
sudo add-apt-repository ppa:gns3/ppa -y
sudo apt update                                
sudo apt install gns3-server -y


#If you want IOU (Cisco IOS on Unix) support, execute the following commands
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gns3-iou -y



#Remove docker if already installed
sudo apt remove docker docker-engine docker.io -y


#Add docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


#Add docker repo and install docker
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce

#Add gns3 user
sudo useradd gns3 --create-home

#Enter a new UNIX password after this command
sudo passwd gns3

#Add gns3 user to the required groups
sudo usermod -aG ubridge,libvirt,kvm,docker gns3