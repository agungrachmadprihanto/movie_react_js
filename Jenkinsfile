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
                sh '. ~/.nvm/nvm.sh && nvm use $NODE_VERSION && npm install'
            }
        }
        stage('Build') {
            steps {
                // Build aplikasi React
                sh '. ~/.nvm/nvm.sh && nvm use $NODE_VERSION && npm run build'
            }
        }
        stage('Test') {
            steps {
                // Jalankan testing
                sh '. ~/.nvm/nvm.sh && nvm use $NODE_VERSION && npm test'
            }
        }
        stage('Deploy') {
            steps {
                // Deploy aplikasi ke port 3000
                sh """
                . ~/.nvm/nvm.sh && nvm use $NODE_VERSION
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
