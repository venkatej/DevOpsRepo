pipeline {
    agent any
	tools {
        maven 'maven-3.5.4' // make sure it is aloready configured under Manage Jenkins --> Global tool Configuration
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
    }
}
