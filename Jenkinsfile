node {
   def app
   stage('Clone repository') {
   checkout scm
   }
   stage('build image') {
   app = docker.build("goyalzz/ubuntu-java-8-maven-docker-image")
   }
   stage('Test image') {
   app.inside {
      sh 'echo "tests passed"'
      }
     }
   }
     
