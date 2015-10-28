sudo apt-get update
sudo apt-get upgrade

sudo apt-get purge maven maven2 maven3
sudo apt-add-repository ppa:andrei-pozolotin/maven3
sudo apt-get update
sudo apt-get install htop git default-jdk maven3

# set JAVA_HOME directory

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 # need to add this to etc/environment?
export PATH=$PATH:$JAVA_HOME/bin/

echo 'JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin/' >> ~/.bashrc

# download and extract spark

wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0-bin-hadoop2.3.tgz
tar -zxf spark-1.1.0-bin-hadoop2.3.tgz
sudo mv spark-1.1.0-bin-hadoop2.3 /srv/spark-1.1.0

sudo ln -s /srv/spark-1.1.0 /srv/spark

export SPARK_HOME=/srv/spark
export PATH=$SPARK_HOME/bin:$PATH

echo 'export SPARK_HOME=/srv/spark' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$PATH' >> ~./bashrc

# Add suppression of warnings of spark


# install ADAM with maven

git clone https://github.com/bigdatagenomics/adam.git
cd adam
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m"
mvn clean package -DskipTests

export ADAM_HOME=/home/ubuntu/adam
echo 'export ADAM_HOME=/home/ubuntu/adam' >> ~/.bashrc


echo 'alias adam-submit="/home/ubuntu/adam/bin/adam-submit"' >> ~/.bashrc
echo 'alias adam-shell="/home/ubuntu/adam/bin/adam-shell"' >> ~/.bashrc

source ~/.bashrc



## Set Maven's memory usage
#
#export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
#
## build spark with Maven
#
#cd spark-1.5.1-bin-hadoop2.6
#
#build/mvn -Pyarn -Phadoop-2.4 -Dhadoop.version=2.4.0 -DskipTests clean package


# To be continued - spot instance crashed

