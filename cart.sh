curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y

useradd roboshop
cd /home/roboshop
curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
unzip /tmp/cart.zip
mv cart-main cart
cd cart
npm install

sed -i -e 's/REDIS_ENDPOINT/redis.kingyamza.online/' -e 's/CATALOGUE_ENDPOINT/catalogue.kingyamza.online/' systemd.service

cd ~
mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
systemctl enable cart
systemclt start cart