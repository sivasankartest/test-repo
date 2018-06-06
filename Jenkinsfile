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
    withSonarQubeEnv('sonarqube') {
      // requires SonarQube Scanner for Maven 3.2+
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
	  }
	}
