FROM node:22-bullseye-slim as build
WORKDIR /build

COPY package.json package-lock.json yarn.lock ./

# install and cache dependencies
RUN --mount=type=cache,target=/home/node/.cache/yarn,sharing=locked,uid=1000,gid=1000 \
    yarn install --immutable

COPY tsconfig.json index.html ./

COPY src ./src

RUN apt-get update && apt-get --yes install ca-certificates && update-ca-certificates

# build
RUN yarn build

# package
RUN yarn package

# zip
RUN tar -czf package.tar.gz package

FROM scratch
COPY --from=build /build/package ./

