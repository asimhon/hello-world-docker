# Get image
FROM java:8

# Add app
ADD java-app/target/demo-eng-days-0.0.1-SNAPSHOT.jar /usr/src/myapp.jar

EXPOSE 80

# application
CMD ["java", "-jar", "/usr/src/myapp.jar"]
