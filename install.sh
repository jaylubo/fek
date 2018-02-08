#!/bin/bash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

apt-get update
apt-get install -y openjdk-8-jre-headless apt-transport-https elasticsearch kibana

curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.sh | sh

/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service
/bin/systemctl start elasticsearch.service

cp /vagrant/kibana.yml /etc/kibana/
/bin/systemctl enable kibana.service
/bin/systemctl start kibana.service

/usr/sbin/td-agent-gem install fluent-plugin-elasticsearch --no-document
cp /vagrant/td-agent.conf /etc/td-agent/
systemctl enable td-agent
systemctl start td-agent
