# Rebuild the original release with a patched Go runtime and supported Alpine.
FROM --platform=$BUILDPLATFORM golang:1.26.7-alpine AS build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /src
ADD https://api.github.com/repos/appleboy/drone-line/tarball/66e7c509dadcee2a60248ff1de28ff55f5b4b159 /tmp/source.tar.gz
RUN echo "d1d9596060eabe09d5070b1d78e318f58f0bacf097b885c3f1a896c615f4f584  /tmp/source.tar.gz" | sha256sum -c - \
    && tar -xzf /tmp/source.tar.gz --strip-components=1 -C /src \
    && CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -o /bin/drone-line .

FROM alpine:3.23
RUN apk add --no-cache ca-certificates
COPY --from=build /bin/drone-line /bin/drone-line
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
