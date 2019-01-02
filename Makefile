TOMCAT_HOME=/c/apache-tomcat-9.0.6
SOLR_HOME=/c/tools/solr-4.6.0

.PHONY: build stop start restart update

build:
	mvn -f freya/pom.xml clean install -DskipTests=true -Pmvn-citi
	cp -v freya/freya-annotate/target/freya.war $(TOMCAT_HOME)/webapps/freya.war

stop:
	sh $(TOMCAT_HOME)/bin/shutdown.sh
	sleep 5
	rm -rf $(TOMCAT_HOME)/webapps/freya*

start:
	sh $(TOMCAT_HOME)/bin/startup.sh

restart: stop start

update: stop build start