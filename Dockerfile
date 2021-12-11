FROM java:8
WORKDIR /
ADD target/*.jar  /hello.jar
CMD java -jar hello.jar
