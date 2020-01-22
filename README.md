# React Docker Tutorial (Development version)
This repository demonstrates how to bootstrap a React app using `create-react-app` and run it as a Docker container. The goal is allowing you to package and run your app in a container to improve your development process!

# Requirements
## NodeJS version 6 or later
You need NodeJS installed on your machine at least version 6, and a general understanding of NPM and how to install, configure, and start a Node app. You don't need experience with React to follow this tutorial, however it is preferred.

## Docker
In order to test the Docker container you need to be able to perform `docker` commands. Familiarity with building and running images is preferred.

# Setup
1. Bootstrap your application with `create-react-app`

```
$ sudo npm i -g npx

$ npx create-react-app my-docker-react-app
```

2. Verify application runs
```
cd my-docker-react-app
npm install
npm start
```

Your browser will likely launch a window or tab for `http://localhost:3000` and you should see a React icon and welcome screen. If everything is running, then `CTRL + C` to stop the app and proceed. If it is not working, visit create-react-app's website for instructions and troubleshooting tips for your environment.

# Add Docker container
Let's proceed to package your app in a container.

## Create Docker image and run script
Add `Dockerfile` as example in this repository

## Build and run Docker image
1. Build docker image.

```
$ docker build -t reactapp .
```

2. Run container
```
$ docker run --rm --name reactapp \
    -v $(pwd):/app \
    -v /app/node_modules \
    -p 3000:3000 \
    -e CHOKIDAR_USEPOLLING=true \
    reactapp
```

Notice that the argument `-v /app/node_modules` does not specify a name for the volume, which means that this is an *anonymous* volume. **Without** the *anonymous* volume ('/app/node_modules'), the node_modules directory would be overwritten by the mounting of the host directory at runtime. An anonymous volume is useful for when you would rather have Docker handle where the files are stored. In other words, this would happen:

1. Build - The node_modules directory is created in the image.
2. Run - The current directory is mounted into the container, overwriting the `node_modules` that were installed during the build.

`Chokidar` is a fast open-source file watcher for NodeJS. You give it a bunch of files, it watches them for changes and notifies you every time an old file is edited; or a new file is created. You need to set the `CHOKIDAR_USEPOLLING` env. variable to `true` if you want warm reloading enabled.

3. Test that your app is running on port 3000 in local browser at http://localhost:3000 and you should see the default React screen. Change your source code to make sure the warm reloading works!

# Congratulations
If you made it this far, then you have successfully create a React app with `create-react-app` and added a Docker image that allows you to configure your application dynamically to run anywhere!
