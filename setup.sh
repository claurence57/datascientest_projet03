#!/usr/bin/bash

BASE_DIR="/home/christophe/Trav/docker/DB"
BASE_DOCKER="${BASE_DIR}/dockerfiles"
API_STATUS_DIR="${BASE_DOCKER}/api_status"
FASTAPI_DIR="${BASE_DOCKER}/fastapi"
DBCONNEXION_DIR="${BASE_DOCKER}/db_connexion"
#AUTHENTICATION_DIR="${BASE_DOCKER}/authentication"
#AUTHORIZATION_DIR="${BASE_DOCKER}/authorization"
#CONTENT_DIR="${BASE_DOCKER}/content"

# Build API_STATUS container
cd ${API_STATUS_DIR}
sudo docker image build . -t api_status:latest
# Build FASTAPI container
cd ${FASTAPI_DIR}
sudo docker image build . -t projet3-api:latest
# Build DB_CONNEXION container
cd ${DBCONNEXION_DIR}
sudo docker image build . -t db_connexion:latest
#cd ${AUTHORIZATION_DIR}
#docker image build . -t authorization:latest
#cd ${CONTENT_DIR}
#docker image build . -t content:latest

# Launch docker-compose
cd ${BASE_DIR}
sudo docker-compose up 

