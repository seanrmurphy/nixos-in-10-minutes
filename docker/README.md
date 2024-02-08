# Bringing up a nix environment with docker

- It is assumed that both `docker` and `docker-compose` are installed and operational on the system
- Running the start script will run a docker container which contains `nix` tooling
- A volume will be created which will persist the contents of `/root` such that the state can be reused after the container has terminated
