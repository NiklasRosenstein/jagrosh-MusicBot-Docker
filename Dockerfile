FROM alpine/curl as downloader

# Download the application.
ARG VERSION
RUN curl -vsfL https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar > JMusicBot-${VERSION}.jar

FROM openjdk:22

WORKDIR /opt/app
ARG VERSION
ENV VERSION=${VERSION}
COPY --from=downloader /JMusicBot-${VERSION}.jar /opt/app/JMusicBot-${VERSION}.jar

WORKDIR /opt/app/config
CMD java -Dnogui=true -jar /opt/app/JMusicBot-${VERSION}.jar
