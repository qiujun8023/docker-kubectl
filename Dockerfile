FROM alpine:latest

ARG TARGETPLATFORM
ARG KUBERNETES_RELEASE

RUN set -ex && \
    wget --no-check-certificate -q https://dl.k8s.io/release/${KUBERNETES_RELEASE}/bin/${TARGETPLATFORM}/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin/kubectl

ENTRYPOINT ["/bin/kubectl"]
CMD ["help"]
