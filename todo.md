# todo

- add ubuntu devcontainer
- add nvim to devcontainer
- add velocity
  - vhost for wavy-bacon.
- deploy pipeline
  - deploy to new server
  - restore from old server
  - drain backups
- run pipeline on push
- add map
- add geyser

## deploy pipeline

- create server id
- create hetzner with ssh key
- create dns
- install software packages
- install minecraft server
- if the old server is reachable
  - stop the old minecraft server
  - drain backups
  - copy latest backup to new minecraft server
  - unpack latest backup
  - notify that old server and dns is ready to be cleaned up
- start new minecraft server
- update front door dns to point to new server
- notify that new server is available
