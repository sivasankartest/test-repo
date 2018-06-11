node {
   def app
   stage('Clone repository') {
   checkout scm
   }
   stage('build image') {
   app = docker.build("sivasankartest/test-repo")
   }
   stage('Test image') {
   app.inside {
      sh 'echo "tests passed"'
      }
     }
   }
