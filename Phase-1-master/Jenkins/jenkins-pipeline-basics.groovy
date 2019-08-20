pipeline {
    agent any
    stages {
        stage('Stage') {
            steps {
                echo 'From Stage'
            }
        }
    }
}
// ===============
pipeline {
    agent any
    stages {
        stage('Stage-1') {
            steps {
                echo 'From Stage-1'
            }
        }
	stage('Stage-2') {
            steps {
                echo 'From Stage-2'
            }
        }
    }
}
// =============
pipeline {
    agent any
	parameters {
		choice(name: 'BUILD', choices: 'release\nsnapshot\n', description: 'Specify whether it is release or snapshot build.')
		choice(name: 'Project', choices: ['Project-1', 'Project-2'], description: 'Select the Project')
		string(name: 'UserName', defaultValue: 'venkat', description: 'Specify the git username.')
		string(name: 'Version', defaultValue: '1.0.0-SNAPSHOT', description: 'Specify the version.')
		password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Pasword')
		booleanParam(name: 'Deploy', defaultValue: false, description: 'Deploy or not')
		text(name: 'DEPLOY_Servers', defaultValue: 'One\nTwo\nThree\n', description: '')
	}
    stages {
        stage('Example-1') {
            steps {
                echo 'Hello World-1'
		println "BUILD: ${params.BUILD}"
		println "UserName: ${params.UserName}"
		println "PASSWORD: ${params.PASSWORD}"
            }
        }
	stage('Example-2') {
            steps {
                echo 'Hello World-2'
		println "Version: ${params.Version}"
		println "Deploy: ${params.Deploy}"
		println "DEPLOY_Servers: ${params.DEPLOY_Servers}"
            }
        }
    }
}
// ============
pipeline {
    agent any
    stages {
        stage('Example-1') {
            steps {
                echo 'Hello World-1'
            }
        }
	stage('Example-2') {
            steps {
                echo 'Hello World-2'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}
//============== Run the below snippet twise. First time job will success by creating new directory.. second time the job will be failed as the directory already exists.
pipeline {
    agent any
    stages {
        stage('Example-1') {
            steps {
                echo 'Hello World-1'
            }
        }
	stage('Example-2') {
            steps {
                echo 'Hello World-2'
		        sh "mkdir dir1"
            }
        }
    }
    post { 
        success { 
            echo 'Run this section when all the stages are success'
        }
	failure { 
            echo 'Run this section when any of the stage is failed'
        }
    }
}
//==============
pipeline {
    agent {
        label 'linux'
    }
	stages {
        stage('Stage-1') {
            steps {
                echo 'Executing from Linux'
            }
        }
    }
}
//==============
pipeline {
    agent {
        label 'windows'
    }
	stages {
        stage('Stage-1') {
            steps {
                echo 'Executing from windows'
            }
        }
    }
}
//===============
pipeline {
    agent {
        label "${params.BUILD_EXECUTOR}"
    }
	parameters {
    
        choice(name: 'BUILD_EXECUTOR', choices: 'linux\nwindows\n', description: 'Specify a Jenkins slave to execute the builds on.')
    }
	stages{
		stage("Stage-Linux"){
			when { expression { params.BUILD_EXECUTOR == 'linux' } }
			
			steps {
                echo 'Executing from linux'
				sh 'mkdir Linux-Dir-${BUILD_NUMBER}'
            }
		}
		stage("Stage-windows"){
			when { expression { params.BUILD_EXECUTOR == 'windows' } }
			
			steps {
                echo 'Executing from windows'
				bat 'mkdir Windows-Dir-%BUILD_NUMBER%'
            }
		}
	}
}
// ============ Example-2 for when
pipeline {
    agent any
    parameters{
        choice(name: 'BUILD', choices: ['SNAPSHOT', 'RELEASE'], description: 'Specify whether it is release or snapshot build.')
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Code checkout from Git'
            }
        }
        stage('Build') {
            steps {
                echo 'Build using maven'
            }
        }
        stage('DEV Deploy') {
            when {
                environment name: 'BUILD', value: 'SNAPSHOT'
            }
            steps {
                echo 'Deploying to DEV env'
            }
        }
        stage('QA Deploy') {
            when {
                environment name: 'BUILD', value: 'RELEASE'
            }
            steps {
                echo 'Deploying to QA'
            }
        }
    }
}
// ============ Environment variables
pipeline {
    agent any
    environment { 
        MyEnvVar = 'clang'
    }
    stages {
        stage('Example') {
            environment { 
                AN_ACCESS_KEY = credentials('jengit') 
            }
            steps {
                sh 'printenv'
            }
        }
    }
}
// ============ Triggers - upstream
pipeline {
    agent any
    triggers { upstream(upstreamProjects: 'Job-1', threshold: hudson.model.Result.SUCCESS) }
    stages {
        stage('checkout') {
            steps {
                cleanWs()
                git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
            }
        }
    }
}
// ======== Triggers -- cron
pipeline{
	agent any
	triggers {
		cron('03 13 * * *')
	}
	stages {
        stage('Stage-1') {
            steps {
                echo "From Stage-1"
            }
        }
	}
}
// ======== Triggers -- pollSCM
pipeline{

	agent any

	triggers {
	    pollSCM('*/1 * * * *')
	}
	stages {
        stage('checkout') {
            steps {
                git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
            }
        }
	}
}
// =========== trigger when condition example-1
pipeline{

	agent any

	triggers {
	    pollSCM('*/1 * * * *')
	}

	stages {
        stage('checkout') {
            steps {
                git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
            }
        }
        stage('deploy') {
            when { 
                    not{
                        triggeredBy 'SCMTrigger'
                    }
                }
            steps {
                echo "Deploy if it not SCMTrigger"
            }
        }
	}
}
// =========== trigger when condition example-2
pipeline{

	agent any
	parameters{
	   choice(name: 'BUILD', choices: ['RELEASE', 'SNAPSHOT'], description: 'Specify whether it is release or snapshot build.')
	}
	triggers {
	    pollSCM('*/1 * * * *')
	    upstream(upstreamProjects: 'Job-1', threshold: hudson.model.Result.SUCCESS)
	    cron('29 13 * * *')
	}
	stages {
	    stage('checkout') {
            steps {
                git branch: 'web', credentialsId: 'jengit', url: 'https://github.com/venkatasykam/DevOpsWebApp.git'
            }
        }
        stage('deploy'){
            when { 
                allOf{
                    triggeredBy 'TimerTrigger'
                    environment name: 'BUILD', value: 'RELEASE'
                }
            }
            steps {
                echo "Deploy only if it TimerTrigger & RELEASE since it is scheduled deployment"
            }
        }
	}
}
// =========== Parallel stages
pipeline{
	agent any
	stages {
        stage('Stage-1') {
            steps {
                echo "From Stage-1"
            }
        }
        stage("Parallel Stages"){
    		parallel {
    			stage('Stage-2') {
    				steps {
    					echo "From Stage-2"
    				}
    			}
    			stage('Stage-3') {
    				steps {
    					echo "From Stage-3"
    				}
    			}
    		}
        }
	}
}
