# docker-web
Docker container for Tablelist Web projects

# Updating the Docker imgage
1) Install Docker Command Line Tools https://docs.docker.com/engine/installation/mac/.
2) Log in to the Docker from the command line https://docs.docker.com/engine/reference/commandline/login/
3) Clone this repository
4) `cd` to the directory of the git repository
5) Make your changes to the `Dockerfile`
6) Create a Docker Container from the update `Dockerfile` by running:
``` bash
docker build -t officert/tablelist-web .
```
7) Push the container to Dockerhub by running:
``` bash
docker push officert/tablelist-web
```
