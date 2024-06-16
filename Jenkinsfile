pipeline {
    agent any

    environment {
        // Ganti dengan versi Node.js yang sesuai
        NODE_VERSION = '14.x'
    }

    stages {
        stage('Preparation') {
            steps {
                script {
                    // Install Node.js menggunakan nvm
                    sh 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash'
                    sh '. ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION'
                }
            }
        }
        stage('Checkout') {
            steps {
                // Cloning repository dari SCM (misalnya GitHub)
                git branch: 'main', url: 'https://github.com/username/repo.git'
            }
        }
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
