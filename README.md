# Jenkins Docker Image

## Important Content notes
The image here uses a volume mount of
    /opt/jenkins
This should be mapped to a named volume on the host machine at container runtime.
if it is not an anonymous volume will be created by docker and used by the running
container

The Jenkins service will be listening on port 443 over https. When issuing the run
command you will need to expose this port.

## Example run commands
This example is assuming there is a local volume named jenkins_home. If one is not
there you can create it with:
    docker volume create jenkins_home
An example run command for this would be
    docker run --rm -v jenkins_home:/opt/jenkins -p 8443:443 sprocket888/jenkins:latest
--rm will remove the container when the process exits.
-v jenkins_home:/opt/jenkins mounts the named volume jenkins_home to /opt/jenkins in the container
-p exposes port 8443 to external hosts and maps it to 443 on the running container