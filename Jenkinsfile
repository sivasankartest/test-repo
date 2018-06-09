pipeline {
	node
	{
checkout scm
    def dockerfile = 'dockerfile'
    def customImage = docker.build("my-image:${env.BUILD_ID}", "-f ${dockerfile} ./dockerfiles") 

	testImage.inside {
        sh 'make test'
}
}
