FROM alpine:latest

ARG OS_ARCH=amd64
ARG TARGETPLATFORM
ARG KUBERNETES_RELEASE=v1.21.5


RUN set -ex && \
    wget --no-check-certificate -q https://dl.k8s.io/release/${KUBERNETES_RELEASE}/bin/linux/${OS_ARCH}/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin/kubectl

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log


ENTRYPOINT ["/bin/kubectl"]
CMD ["help"]
