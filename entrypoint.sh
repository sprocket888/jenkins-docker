#!/bin/ash

set -e

# The jenkins server will run over HTTPS with a self signed cert this script
# will generate the proper JKS
exec /bin/ash self-signed-ssl.sh &

# This will look at the command line args, if the first one is "jenkins"
# it will run the command to start the jenkins server, otherwise it will
# try to execute whatever is there. this is useful when starting the
# docker container to provide something like /bin/ash to override the normal
# start command and fire up a shell instead.

if [ "$1" = 'jenkins' ]; then
    exec java -jar /jenkins.war $JENKINS_ARGS
fi

exec "$@"
