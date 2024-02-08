# nixos-in-10-minutes

A simple repo which makes it easy to bring up a NixOS instance in 10 minutes. This is based on
nixos-anywhere.

Prerequisites:
- `docker` and `docker-compose` running on the local machine
- a remote linux VM in which the root account can be accessed via ssh

How this works:
- bring up the docker container which provides a flake enabled nix environment
- create a new ssh key inside the container and put the pubkey on the remote VM in the root account
- check the disk configuration
- run nixos-anywhere

See this post for more details.

