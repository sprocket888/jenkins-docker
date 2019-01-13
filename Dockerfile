FROM alpine:latest

# Install needed packages to run Jenkins
RUN apk add openjdk8 ttf-dejavu

RUN mkdir -p /opt/jenkins

ENV JENKINS_HOME /opt/jenkins
ENV JENKINS_ARGS --httpPort=8081

COPY ./jenkins.war /opt/jenkins
COPY ./entrypoint.sh /

#VOLUME ["/opt/jenkins"]

#CMD ["/bin/ash"]
#CMD ["java","-jar","/opt/jenkins/jenkins.war","$JENKINS_ARGS"]
CMD ["/bin/ash","entrypoint.sh"]