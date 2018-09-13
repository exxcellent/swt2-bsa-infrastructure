# swt2-bsa-infrastructure

SWT2 - Bogenliga Application - Docker Infrastruktur zum Projekt

Run `script/server.sh` to

- clone project repositories
- setup git configuration
- install node dependencies
- build frontend
- copy frontend files to the frontend docker
- build backend
- copy jar file to the backend docker
- start docker

Run `script/reset.sh` to delete all generated files(!)

## TODO

- migrate database
- start dev mode (only start database)
- fix file permissions
