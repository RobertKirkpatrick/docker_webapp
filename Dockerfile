FROM ubuntu:latest

MAINTAINER Your Name "rk3505@nyu.edu"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8080

CMD flask run --host=0.0.0.0 --port=8080
