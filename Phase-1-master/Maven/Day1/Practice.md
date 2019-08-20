# Maven Practice

## Step-1: Install jdk1.8
	
	Refer: Java_Maven_Setup.docx which available under Day1 folder.

	Download from: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
	
	jdk - java development kit - code compilation

	jre - java runtime environment - to run the java applications

	Setup the jdk path under system/user varialbles. And Create JAVA_HOME variable in system variables.

	java -version --> check whtehr java setup done or not.

## Step-2: Download maven & setup the path.

	Refer: Java_Maven_Setup.docx which available under Day1 folder.
	
	Doownload from: https://maven.apache.org/download.cgi
	
	Setup the maven bin path under system/user variables.
	
	mvn -version or mvn --version or mvn -v --> check whtehr maven setup done or not.

	What is maven? --> Maven is an automated build tool.

	maven will
		1. compile the code, 
		2. test the original code (i.e., compile & runn the junit tests)
		3. package the compiled code (.jar, .war, .ear, .zip etc)
		4. deploy the package to remote server (tomcat/jboss application server, nexus/artifactory package/repo manager)
		5. code coverage & quality check etc (with the help of thrid party plugin checkstyle, jacoco, sonar etc.
		
		etc

	Why maven is automated build tool? -- maven has standard lifecycle pahses. --> https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

	Different types of packages in java:

		JAR, WAR, EAR, ect

		JAR - Java ARchive - simple utility project.  .class + .properties

		WAR - Web Application Resource or Web application ARchive - lot of JARs + html,jsp,js, htm, etc + .properties + etc

		EAR - enterprise archive - JARs+ WARs  OR JARs+ WARs + ESB etc

		ZIP - Zipping any files like xml or properties etc

## Step-3: JAR Project Setup: 
          
	   mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

					1. maven(the above command) will create a folder structure for java project.
						two sections
						1.1. source code section - src
						1.2. build script - pom.xml - Project Object Model
					2. It will package with the type JAR.
          
	Observe:
		1. src folder structure in tree command. tree /F
		2. What is maven standard path under src folder.
			2.1. src/maven/java - for original sourcs code. i.e., *.java ex: Add.java
			2.2. src/test/java - for junit files i.e., *Test.java ex: AddTest.java
		3. what is groupId, artifactId, version, package in pom.xml file. etc.
				
        Syntax to generate maven project for JAR: mvn archetype:generate -DgroupId=<your project groupid> -DartifactId=<project Name> -Dversion=<project version> -DarchetypeArtifactId=maven-archetype-quickstart

## Step-4: Run the build: mvn clean package

	Observe the build console:

		1. how the package is creating?
		2. whar are the minium required tags/elements in pom.xml file. (comment & un-comment some of the tags groupId, artifactId, version, package in pom.xml & then try the build)
		3. What are the maven goals are running? & what is happening for each goal like cleaning taregt folder, creating taregt folder, resource loading, compile, test compile etc

## Step-5: Generate the other project structures & types

	WAR Project Setup: mvn archetype:generate -DgroupId=com.doha.web.login -DartifactId=LoginApp -DarchetypeArtifactId=maven-archetype-webapp
	EAR Project Setup: mvn archetype:generate -DgroupId=com.doha.web.login -DartifactId=LoginAppEAR -DarchetypeArtifactId=maven-archetype-j2ee-simple

	Observe the web project file/folder strructure what are the default files/folder are created by the maven archetype.

	Just run the command: mvn archetype:generate > archetypes-log.txt --> once it is done open the file archetypes-log.txt and see how many archetypes providing by maven.


## Maven repositories:

	Local repo: C:\Users\<username>\.m2\repository

	Centarl repo (maven repo):  https://repo.maven.apache.org/

	Remote repo: nexus/artifactory.
	
	Local repo --> Centarl repo --> Remote repo

# What you learnt


1. Compilation: 

   Converting from .java files to .class
   
2. we need to re-compile for every change in .java files.

3. Project structure for different java/maven projects.

	mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart
	
	src/main/java --> *.java (original source)
	src/test/java --> *Test.java (jnunit test files)
	
4. Maven lifecycle phases (upto install>

5. Maven will genarte a quality product/package. (bcs of junit test cases)
