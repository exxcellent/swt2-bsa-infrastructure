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

## Resources

- Angular Tutorial: https://angular.io/tutorial 
- Bootstrap W3 Schools: https://www.w3schools.com/bootstrap4/default.asp 
- Flexbox: http://grochtdreis.de/schulungen/html5days-2018-1/flexbox-praxis/index.html#/ 
- Redux: https://redux.js.org/basics 
- Icons: https://material.io/tools/icons/?style=baseline 
- Jasmin and Karma: https://codecraft.tv/courses/angular/unit-testing/jasmine-and-karma/
- Jasmin and Karma: https://jasmine.github.io/2.0/introduction.html
