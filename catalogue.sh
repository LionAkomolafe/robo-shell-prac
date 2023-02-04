curl -sL https://rpm.nodesource.com/setup_lts.x | bash

yum install nodejs -y

useradd roboshop
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
cd /home/roboshop
rm -rf catalogue
unzip -o /tmp/catalogue.zip
mv catalogue-main catalogue
cd catalogue
npm install

sed -i -e 's/MONGO_DNSNAME/mongod.kingyamza.online/' systemd.service
cd ~
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
systmectl daemon-reload
systemctl enable catalogue
systemctl start catalogue