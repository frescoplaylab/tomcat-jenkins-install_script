wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.zip
unzip apache-tomcat-8.5.45.zip
cd apache-tomcat-8.5.45/webapps
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
cd manager/META-INF
sed -i 's/<Valve/<!-- <Valve/; s/<\/Context>/ --> <\/Context>/' context.xml
cd .. && cd .. && cd ..
cd conf
sed -i 's/8080/80/g' server.xml
sed -i 's/<\/tomcat-users>/<role rolename="manager-gui"\/><role rolename="manager-script"\/><user username="admin" password="admin" roles="manager-gui,manager-script"\/><\/tomcat-users>/g' tomcat-users.xml`{{execute}}
cd ..
cd bin
chmod 777 *.sh
./startup.sh
