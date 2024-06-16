pipeline {
    agent any

    environment {
        // Ganti dengan versi Node.js yang sesuai
        NODE_VERSION = '14.21.3'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                // Install dependencies menggunakan npm atau yarn
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                // Build aplikasi React
                sh 'npm run build'
            }
        }  
        stage('Deploy') {
            steps {
                // Deploy aplikasi ke port 3000
                sh """
                npm install -g serve
                serve -s build -l 3000 &
                """
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
