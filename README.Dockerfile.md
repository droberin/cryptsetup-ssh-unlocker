# Building a Docker image
Simply run `./build_docker.sh` with no parameters. It'll create an image called `ssh-unlock:VERSION`
where VERSION is based on specified version of unlocker library.

If first arg is set it will create `$1:ssh-unlock:VERSION` so you can upload it easier to DockerHub if you want to.

# Running a container
At this time this Dockerfile is capable of using file configuration only as `config.ini`, which should be mounted in container's `/usr/src/config` directory.

All private keys or configuration must be in this directory and properly referenced in configuration file `config.ini`. Mind that inside container all these files would be in `/usr/src/config/your_expeted_file`. This means that using `ConfigMap` object it could run easily on Kubernetes.

## Docker run example
`docker run -ti --rm -v $HOME/ssh-unlock/config/:/usr/src/config/ ssh-unlock:0.2`

## Docker run example as daemon
`docker run -d --name ssh-unlock -v $HOME/ssh-unlock/config/:/usr/src/config/ ssh-unlock:0.2`

## See daemon logs
`docker logs -f ssh-unlock`
