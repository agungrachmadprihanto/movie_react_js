pipeline {
    agent any

    stages {
        stage('Build and Deploy') {
            steps {
                script {
                    // Make sure the deliver.sh script is executable
                    sh 'chmod +x jenkins/scripts/deliver.sh'

                    // Run the deliver.sh script
                    sh 'jenkins/scripts/deliver.sh'
                }
            }
        }
    }
}
