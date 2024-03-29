pipeline {

  options {
    ansiColor('xterm')
  }

  agent {
    kubernetes {
      yamlFile 'builder.yaml'
    }
  }

  stages {
    stage('build && sonarqube analysis') {
      steps {
        container('java-build-tools') {
	  withSonarQubeEnv('sonar') {
	    script {
	      sh '''
	      mvn clean package sonar:sonar -Dsonar.projectKey=java-petclinic  -Dsonar.host.url=http://172.16.16.239:9000 -Dsonar.login=1bd83c2595d78fd6d47ea32158808d95285aae4f
	  
	    '''
      }
     }
    }
   }
  }
    stage('Kaniko Build & Push Image') {
      steps {
        container('kaniko') {
          script {
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile \
                             --context `pwd` \
                             --destination=haissreddy1/devops:${BUILD_NUMBER}
            '''
          }
        }
      }
    }

    stage('Deploy App to Kubernetes') {     
      steps {
        container('kubectl') {
          withCredentials([file(credentialsId: 'mykubeconfig', variable: 'KUBECONFIG')]) {
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" myweb.yaml'
            sh 'kubectl apply -f myweb.yaml'
          }
        }
      }
    }
  
  }
}
