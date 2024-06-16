pipeline {
    agent any

    environment {
        // Ganti dengan versi Node.js yang sesuai
        NODE_VERSION = '14.21.3'
        NPM_CONFIG_PREFIX = '${env.WORKSPACE}/.npm-global'
    }

    stages {
        stage('Setup NPM Global Directory') {
            steps {
                sh 'mkdir -p ${env.NPM_CONFIG_PREFIX}/bin'
                sh 'npm config set prefix ${env.NPM_CONFIG_PREFIX}'
                sh 'export PATH=${env.NPM_CONFIG_PREFIX}/bin:$PATH'
            }
        }
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
                  npx serve -s build -l 3000 &
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
