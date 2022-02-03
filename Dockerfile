FROM alpine:latest

ARG OS_ARCH=amd64
ARG KUBERNETES_RELEASE=v1.21.5

RUN set -ex && \
    wget --no-check-certificate -q https://dl.k8s.io/release/${KUBERNETES_RELEASE}/bin/linux/${ARCH}/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin/kubectl

ENTRYPOINT ["/bin/kubectl"]
CMD ["help"]
