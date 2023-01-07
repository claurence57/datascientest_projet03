FROM debian:latest
RUN apt update -y && apt upgrade -y && apt autoremove && apt install -y python3 python3-pip 
RUN pip3 install requests
ADD api_status.py /projet3/api_status.py
WORKDIR /projet3
CMD python3 api_status.py

