git pull origin main

sed -i '4d' android/gradle.properties 
echo "org.gradle.java.home=C:\\\Program Files\\\Java\\\jdk-11.0.13" >> android/gradle.properties
