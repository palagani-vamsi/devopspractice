FROM gradle:8.7-jdk21
WORKDIR /app
COPY build.gradle settings.gradle gradlew ./
COPY gradle gradle
RUN chmod +x gradlew
COPY src src
COPY genproto.sh ./
RUN gradle clean build -x test -x verifyGoogleJavaFormat --no-daemon
EXPOSE 8085
CMD ["java", "-jar", "build/libs/app.jar"]
