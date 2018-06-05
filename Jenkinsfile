pipeline {
     agent any
   stages {
      stage ('compile stage') {
	    steps {
		sh 'mvn clean compile'
	}
	}
	stage ('testing stage') {
	   steps {
	   	   sh 'mvn test'
	   	   }
	   }
	stage ('deployment') {
	   steps {
	   	   sh 'mvn deploy'
	   	   }
	   }
	   stage('SonarQube analysis') {
    // requires SonarQube Scanner 2.8+
    def scannerHome = tool 'SonarQube Scanner 2.8';
    withSonarQubeEnv('sonarqube') {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
	  }
	}
