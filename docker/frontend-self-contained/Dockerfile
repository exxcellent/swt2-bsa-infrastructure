#  Create a new image from the base nodejs image
FROM node:10

# Instal http server
RUN npm i -g http-server
RUN npm i -g @angular/cli

# Clone Frontend Git Repository
RUN git clone https://github.com/exxcellent/swt2-bsa-frontend.git

WORKDIR /swt2-bsa-frontend/bogenliga

RUN npm install

RUN npm install

# Open 80 port. This is the port that our development server uses
EXPOSE 8080

RUN ng build --prod --configuration=production

ENTRYPOINT http-server ./dist/bogenliga --port=8080 -c-1