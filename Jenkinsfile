pipeline {
	agent{
		docker.build {dockerfile}
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
