FROM onsdigital/flask-crypto

COPY server.py /app/server.py
COPY settings.py /app/settings.py
COPY startup.sh /app/startup.sh

# set working directory to /app/
WORKDIR /app/

EXPOSE 5000

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -yq git gcc make build-essential python3-dev python3-reportlab
RUN git clone https://github.com/ONSdigital/sdx-common.git
RUN pip3 install ./sdx-common

ENTRYPOINT ./startup.sh
