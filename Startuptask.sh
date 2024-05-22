/bin/bash -c "sudo add-apt-repository -y \"deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted\" && sudo apt-get -y update && sudo apt-get -y install python3-pip && sudo pip3 install scapy && 
git clone https://github.com/henrikmotzkus/webtest.git"
