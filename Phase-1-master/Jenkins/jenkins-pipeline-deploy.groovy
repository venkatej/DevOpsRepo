pipeline {
    agent any
	tools {
        maven 'maven-3.5.4' 
    }
	parameters {
        string(name: 'releaseVersion', defaultValue: "1.0", description: 'Specify the version.')
	}
    stages {
        stage('Checkout') {
            steps {
                git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
            }
        }
		stage('Build') {
            steps {
                sh 'mvn clean package -DreleaseVersion=${releaseVersion}.${BUILD_NUMBER}'
            }
        }
		stage('Deploy') {
            steps {
                sh '''
					echo Deploy the war to tomcat server.

					echo Step-1: Removing the existing package
					rm -rf /root/tomcat7/webapps/DevOpsWebApp-*.war
					rm -rf /root/tomcat7/webapps/DevOpsWebApp-*

					echo Step-2: Staging the new package to tomcat server.
					cp ${WORKSPACE}/target/*.war /root/tomcat7/webapps
				'''
            }
        }
    }
}