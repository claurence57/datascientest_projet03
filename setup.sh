#!/usr/bin/bash

BASE_DIR="/home/christophe/Trav/docker/datascientest_projet03"
BASE_DOCKER="${BASE_DIR}/dockerfiles"
API_STATUS_DIR="${BASE_DOCKER}/api_status"
FASTAPI_DIR="${BASE_DOCKER}/fastapi"
DBCONNEXION_DIR="${BASE_DOCKER}/db_connexion"
PG_DATA=${BASE_DIR}/postgres_data

# Directory for postgres DB
[[ -d $PG_DATA ]] || mkdir $PG_DATA

# Build API_STATUS container
cd ${API_STATUS_DIR}
sudo docker image build . -t api_status:latest
# Build FASTAPI container
cd ${FASTAPI_DIR}
sudo docker image build . -t projet3-api:latest
# Build DB_CONNEXION container
cd ${DBCONNEXION_DIR}
sudo docker image build . -t db_connexion:latest

# Launch docker-compose
cd ${BASE_DIR}
sudo docker-compose up 

