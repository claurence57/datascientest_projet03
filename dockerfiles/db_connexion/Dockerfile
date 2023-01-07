FROM debian:latest
RUN apt update -y && apt upgrade -y && apt autoremove && apt install -y python3 python3-pip 
RUN pip3 install requests
ADD db_connexion.py /projet3/db_connexion.py
WORKDIR /projet3
CMD python3 db_connexion.py

