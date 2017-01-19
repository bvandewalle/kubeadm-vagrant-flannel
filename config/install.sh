#!/bin/sh

# Source: http://kubernetes.io/docs/getting-started-guides/kubeadm/
set -e

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
add-apt-repository ppa:masterminds/glide
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

apt-get install -y tmux ruby apt-transport-https ca-certificates autojump git python python-pip libnetfilter-queue-dev libelf-dev htop ntp
apt-get install -y --allow-unauthenticated linux-image-extra-$(uname -r) linux-image-extra-virtual docker-engine
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

gem install tmuxinator
systemctl enable docker
usermod -aG docker ubuntu
git clone https://github.com/jimeh/tmux-themepack.git /home/ubuntu/.tmux-themepack

cd /tmp
wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.7.3.linux-amd64.tar.gz

systemctl disable ufw

systemctl daemon-reload
service docker restart
