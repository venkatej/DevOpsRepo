node{
    stage('checkout'){
        echo "code closing phase"
        git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
    }
    stage('build'){
        
        echo "jenkins parameter: ${params.releaseVersion}"
        
        echo "code build using maven"
        
        sh '"/root/apache-maven-3.5.4/bin/mvn" -V clean package'
        
        sh'''
            echo "shell command line-1"
            # mkdir sample-dire2
            pwd
        '''
    }
    stage('sonar'){
        echo "sonar code quality check"
    }
    stage('deploy-nexus'){
        echo "package deploy to nexus"
    }
    stage('deploy-server'){
        echo "package deploy to tomcat server"
        sh '''
            echo Deploy the war to tomcat server.
    
            echo Step-1: Removing the existing package
            rm -rf /root/tomcat7/webapps/DevOpsWebApp-*.war
            rm -rf /root/tomcat7/webapps/DevOpsWebApp-*
    
            echo Step-2: Staging the new package to tomcat server.
            cp ${WORKSPACE}/target/*.war /root/tomcat7/webapps
        '''
    }
    stage('test'){
        echo "Selenium automation script will run"
    }
}
