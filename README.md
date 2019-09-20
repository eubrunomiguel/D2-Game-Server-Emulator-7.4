# D2 Server
D2 Server is based on OTHire. OTHire is a free MMORPG emulation, that creates a own gameworld server, based on the CIPSoft's Tibia version 7.72. It is a fork of the OpenTibia Server project.

New features:
- full 7.4 features
- cast
- tasks
- guild war
- expanded real map, including Yalahar
- market
- conjured runes
- hunted system
- [external repository] mobile app

# Setup
We provide automated scripts to compile, run and manage the server and all its dependencies. The server and dependencies can run on any machine that supports `docker`.

To start, please clone (or download) this repository and follow the next two steps:
1. Provisioning 
2. Dependencies
3. [Optional] DDoS protection rules
## 1. Provisioning
Rent or buy any Linux machine. We recommend Ubuntu or Debian.
## 2. Dependencies
SSH to the machine and execute the following script. It will install `docker`: 
```
./@devops/vm/boot.sh
```
Next, register an account in `hub.docker.com` and login on your machine with:
```
docker login --username=<your_docker_username> --password=<your_docker_password>
```
## 3. Firewall
This step is optional. It loads firewall rules to alleviate DDoS attacks.
Execute:
```
./@devops/vm/firewall.sh
```
# Running
All the following requirements are automated by our scripts: 
- compiling
- editing ip addresses and database information in the `config.lua` file
- booting, installing and importing the database
## Configuration
You must add the ip address of your machine on:
```
./env/vm.env
```
You can (must for security) edit the database configuration (passwords) on:
```
./env/mysql.env
```
## Compiling
To run the application, you will need to build and push (optionally) a docker image with your server files.
```
cd server
docker build -t <your_docker_username>/tibia:<release-version> .
```
Optionally, you can push to your docker repository. Note, ensure your repository is `private` so other users do not have access to it.
```
docker push <your_docker_username>/tibia:<release-version>
```
## Turning On/Off the Server
To turn on the server, execute:
```
docker-compose up server
```
To turn off the server, execute:
```
docker-compose down server
```
# Map
![alt text](https://github.com/eubrunomiguel/OTHire/blob/master/server/misc/map.bmp?raw=true)
