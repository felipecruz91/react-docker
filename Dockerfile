FROM node:12.14.1-alpine

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install react-scripts@3.0.1 -g

EXPOSE 3000

# start app
CMD ["npm", "start"]
