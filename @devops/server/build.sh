#!/usr/bin/env bash

# Root folder
cd ./server

# Move world so we can properly layer the image
mv data/world .

# Build image
docker build -t eubrunomiguel/tibia .

# Move folder back
mv world data/