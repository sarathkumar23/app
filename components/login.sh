#!/bin/bash


source components/common.sh


#Used export instead of service file

DOMAIN=msarathkumar.online


OS_PREREQ

Head "Adding user"
useradd -m -s /bin/bash todo &>>$LOG

Head "Changing directory to todo"
cd /home/todo/

Head "Installing go language"
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local &>>$LOG


go version


~/.profile

Head "Exporting to path"
export PATH=$PATH:/usr/local/go/bin

source ~/.profile

Head "Creating a directory go"
mkdir ~/go &>>$LOG


mkdir -p ~/go/src &>>$LOG


cd  ~/go/src/

DOWNLOAD_COMPONENT


cd login/


apt update

Head "Installing go-dep"

apt install go-dep &>>$LOG

go get &>>$LOG

go build &>>$LOG


Head "pass the EndPoints in Service File"
sed -i -e "s/user_endpoint/users.${DOMAIN}/" systemd.service
Stat $?

Head "Setup the systemd Service"
mv systemd.service /etc/systemd/system/login.service &>>$LOG
Stat $?
systemctl daemon-reload && systemctl start login && systemctl enable login &>>$LOG
Stat $?
