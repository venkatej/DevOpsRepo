# PipelineScript

### Checkout the code:

        node {
           stage('Checkout') {
              //Checkout the code from a GitHub repository
              git credentialsId: 'jenkinsGitHub', url: 'https://github.com/DIGITALAPPLICATION/WebApp.git'
              }
        }

### Checkout the code + Build:

        node{
          stage('Checkout'){
            //Checkout the code from a GitHub repository
            git credentialsId: 'jenkinsGitHub', url: 'https://github.com/DIGITALAPPLICATION/WebApp.git'
          }
          stage('build'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean verify'
          }
        }

### Checkout the code + build + test +deploy to nexus: four stages
        node{
          stage('Checkout'){
            //Checkout the code from a GitHub repository
            git credentialsId: 'jenkinsGitHub', url: 'https://github.com/DIGITALAPPLICATION/WebApp.git'
          }
          stage('build'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean compile'
          }
          stage('test'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean test'
          }
                       stage('deploy-to-nexus'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean deploy'
          }
        }

### Checkout the code + build + test +deploy to nexus + deploy to tomcat server: 5 stages

        node{
          stage('Checkout'){
            //Checkout the code from a GitHub repository
            git credentialsId: 'jenkinsGitHub', url: 'https://github.com/DIGITALAPPLICATION/WebApp.git'
          }
          stage('build'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean compile'
          }
          stage('test'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean test'
          }
          stage('deploy-to-nexus'){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean deploy'
          }
          stage('deploy-to-tomcat'){
            sh '''
            echo Deploy the war to tomcat server.

            echo Step-1: Removing the existing package
            rm -rf /root/tomcat7/webapps/WebApp-*.war
            rm -rf /root/tomcat7/webapps/WebApp-*

            echo Step-2: Staging the new package to tomcat server.
            cp ${WORKSPACE}/target/*.war /root/tomcat7/webapps
            '''
          }
        }

### Remove unnecessary phases compile, test since these two goals are covered in deploy phase by default.

        Checkout the code + build(compile+test+deploy the package to nexus) + deploy to tomcat: five stages

        node{
          stage('Checkout'){
            //Checkout the code from a GitHub repository
            git credentialsId: 'jenkinsGitHub', url: 'https://github.com/DIGITALAPPLICATION/WebApp.git'
          }
          stage(' build(compile+test+deploy the package to nexus) '){
            sh '"/root/apache-maven-3.5.3/bin/mvn" -V clean deploy'
          }
          stage('deploy-to-tomcat'){
            sh '''
            echo Deploy the war to tomcat server.

            echo Step-1: Removing the existing package
            rm -rf /root/tomcat7/webapps/WebApp-*.war
            rm -rf /root/tomcat7/webapps/WebApp-*

            echo Step-2: Staging the new package to tomcat server.
            cp ${WORKSPACE}/target/*.war /root/tomcat7/webapps
            '''
          }
        }
------------------------------------------------------------------------------------------
