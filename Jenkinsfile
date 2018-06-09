pipeline {
	node
	{
checkout scm
    def dockerfile = 'Dockerfile.test'
    def customImage = docker.build("my-image:${env.BUILD_ID}", "-f ${dockerfile} ./dockerfiles") 

	testImage.inside {
        sh 'make test'
}
}
