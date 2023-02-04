curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y

useradd roboshop
cd /home/roboshop
curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
unzip /tmp/user.zip
mv user-main user
cd user
npm install

sed -i -e 's/REDIS_ENDPOINT/redis.kingyamza.online/' -e 's/MONGO_ENDPOINT/mongo.kingyamza.online/' systemd.service
cd ~
mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user
systemctl start user