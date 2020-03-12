#!/usr/bin/env bash

# Git
yum install git -y

# JDK
cat <<'EOF' > /etc/yum.repos.d/adoptopenjdk.repo
[AdoptOpenJDK]
name=AdoptOpenJDK
baseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
EOF

# adoptopenjdk-N-hotspot/adoptopenjdk-N-openj9 
# where 'N' is 8, 11, 12, 13
#
#yum update -y
yum install adoptopenjdk-8-openj9 -y

# sbt
#sbt_version="sbt-1.3.8.rpm" 
#wget http://dl.bintray.com/sbt/rpm/${sbt_version}
#sudo yum install ${sbt_version} -y
# 
 curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
 yum install sbt -y
#

# Docker
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf install docker-ce --nobest -y
systemctl enable docker
systemctl start docker
