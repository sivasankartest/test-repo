pipeline {
	agent{
  checkout scm
  env.PATH = "${tool 'Maven3'}/bin:${env.PATH}"
  stage('Package') {
    dir('webapp') {
      sh 'mvn clean package -DskipTests'
    }
  }

  stage('Create Docker Image') {
    dir('webapp') {
      docker.build("arungupta/docker-jenkins-pipeline:${env.BUILD_NUMBER}")
    }
  }
	}
  stages {
    stage ('clean and compile') {
	  steps {
	  sh 'mvn clean compile'
		     }
        }
    stage ('package') {
      steps {
         sh 'mvn package'
            }
        }
    stage ('install') {
      steps {
         sh 'mvn install'
            }
		}
    stage ('deploy') {
         sh 'mvn deploy'
            }
        }
     }
}
