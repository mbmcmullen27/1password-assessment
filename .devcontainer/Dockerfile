FROM node:22-bullseye-slim as build
WORKDIR /app
RUN apt-get update && apt-get --yes install \
    ca-certificates &&\
    update-ca-certificates

