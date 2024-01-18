#using ARG in Dockerfile of Helloworld project
ARG javaVersion=17
FROM openjdk:${javaVersion}
ADD SpringStarter-0.0.1-SNAPSHOT.jar test.jar
ARG exposePort=8080
EXPOSE ${exposePort}
ENTRYPOINT ["java" ,"-jar" ,"test.jar"]
ARG msg="Welcome"
RUN echo "Hello All, ${msg} to docker"


#FROM creates a layer from an existing Java base image that exists locally or 
#in any container registry that runs our container. openjdk:11 will be the one to use.

#VOLUME creates a specific space to persist some data in your container.
#The tmp folder will store information.

#EXPOSE informs Docker that the container listens to the specified
#network ports at runtime. This is the port to access to the Spring Boot container
#and will be used to run the container.

#ARG defines a variable that can be passed to the application at runtime. 
#For example, we pass the location of the final jar file within the target folder
#and save it in a JAR_FILE variable. You can also pass more arguments 
#like credentials, keys, and environment variables with their respective values.

#ADD copies new files, directories or remote file URLs from the source 
#and adds them to the filesystem of the image at the provided path. 
#In our case we add the Spring Boot application to the Docker image from the 
#source path (the JAR_FILE variable) to a destination named app.jar.

#ENTRYPOINT specifies the command that Docker will use to run our app. 
#In this case it will pass the common command to run 
#a jar — java -jar <name of the jar> — so in this case it is java -jar app.jar 
#to our ENTRYPOINT option (remember that we renamed the SpringStarter-0.0.1-SNAPSHOT.jar file 
#to test.jar).