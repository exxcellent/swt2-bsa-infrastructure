# Build Maven Image
FROM maven:3.5-jdk-8 AS build  

# Clone Backend Git Repository
RUN git clone https://github.com/exxcellent/swt2-bsa-backend.git

# Change in bogenliga file
WORKDIR /swt2-bsa-backend/bogenliga

# maven clean package without tests
RUN mvn clean package -DskipTests

# Expose Ports
EXPOSE 9000 9000
EXPOSE 9001 9001

ENTRYPOINT java -jar bogenliga-application/target/bogenliga-application-1.0.0.jar
