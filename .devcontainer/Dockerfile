FROM node:22-bullseye-slim
WORKDIR /app

RUN apt-get update && apt-get --yes install \
    ca-certificates git curl &&\
    update-ca-certificates 

RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb 


USER node
CMD ["bin/bash"]