FROM docker.io/bellsoft/liberica-runtime-container:jre-23-slim-musl
LABEL maintainer="https://github.com/PBH-BTN/PeerBanHelper"
COPY target/libraries /app/libraries
COPY target/PeerBanHelper.jar /app/PeerBanHelper.jar
USER 0
EXPOSE 9898
ENV TZ=UTC
ENV JAVA_OPTS="-Dpbh.release=docker -Djava.awt.headless=true -Xmx512M -Xms16M -Xss512k -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+ShrinkHeapInSteps"
WORKDIR /app
VOLUME /tmp
ENTRYPOINT ["sh", "-c", "${JAVA_HOME}/bin/java ${JAVA_OPTS} -jar PeerBanHelper.jar"]