ARG IMAGE_TAG="12-slim"
ARG IMAGE_NAME="debian"

FROM $IMAGE_NAME:$IMAGE_TAG as base
ENV UserName=test
ENV Password=test
ENV VNCPassword=123456

COPY ["./install.sh", "/var/tmp/install.sh"]
COPY ["./start.sh", "/var/tmp/start.sh"]

RUN chmod +x /var/tmp/*.sh
RUN /var/tmp/install.sh

CMD /var/tmp/start.sh