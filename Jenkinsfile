pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'myapp:latest'
        DOCKER_CONTAINER_NAME = 'myapp-container'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh '''
                    docker stop ${DOCKER_CONTAINER_NAME} || true
                    docker rm ${DOCKER_CONTAINER_NAME} || true
                    '''

                    // Run the new container
                    docker.image(DOCKER_IMAGE).run("-d -p 80:80 --name ${DOCKER_CONTAINER_NAME}")
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
