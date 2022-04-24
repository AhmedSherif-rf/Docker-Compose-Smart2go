#!/bin/bash

#test

#echo "Performing a clean Maven build"
./mvnw clean package -Pjar -DskipTests=true

#echo "Building the smart2goadmin"
cd "003_smart2goadmin"
docker build -t smart2goadmin .
cd ..

#echo "Building the smart2Goback"
cd "001_smart2goback"
docker build -t smart2go .
cd ..

#echo "Building the smart2gofront"
cd "002_smart2gofront"
docker build -t smart2gofront .
#cd ..

