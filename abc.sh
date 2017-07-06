	#!/bin/bash
	#Script to install Tomcat 8 on ubuntu machine
	wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz
	tar xzf apache-tomcat-8.5.15.tar.gz
	mkdir -p /opt/tomcat/
	mv apache-tomcat-8.5.15/* /opt/tomcat/
	apt-get install default-jdk
	sudo apt-get install default-jdk
	sudo update-java-alternatives -l
	export JAVA_HOME=/usr/lib/jvm/default-java
	mkdir /opt/tomcat
	echo CATALINA_HOME=/opt/tomcat
	#echo "export CATALINA_HOME="/opt/tomcat"" >> ~/.bashrc
	source ~/.bashrc
	groupadd tomcat
	useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
	cd /opt/
	chown -hR tomcat:tomcat *
	chmod +x /opt/tomcat/bin/*.sh
	source ~/.bashrc
	apt-get install tomcat8-admin
	cd /opt/tomcat/bin/
	./catalina.sh start
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins



