pipeline {
    agent any
         environment {
            CI = 'true'
        }
    stage('Deliver') {
            steps {
                sh 'chmod +x jenkins/scripts/deliver.sh'
                sh 'jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'chmod +x jenkins/scripts/kill.sh'
                sh 'jenkins/scripts/kill.sh'
            }
        }
    }
}
