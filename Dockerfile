FROM alpine:latest

# Install needed packages to run Jenkins
RUN apk add openjdk8 ttf-dejavu openssl

RUN mkdir -p /opt/jenkins && wget http://mirrors.jenkins.io/war/2.158/jenkins.war

ENV JENKINS_HOME /opt/jenkins

# NOTE the Keystore filename and password are derived from the self-signed-ssl.sh 
# script that is used if that is changed then the values here need to be updated.

ENV JENKINS_ARGS --httpPort=-1 --httpsPort=443 --httpsKeyStore="/jenkins.jks" --httpsKeyStorePassword="notsecure01"

EXPOSE 443

COPY ./entrypoint.sh ./self-signed-ssl.sh /

VOLUME ["/opt/jenkins"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["jenkins"]
