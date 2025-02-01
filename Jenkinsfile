pipeline {
    agent any

    tools {
        nodejs 'Node JS 22' // Sesuaikan dengan nama Node.js yang dikonfigurasi di Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/faizalardhi16/nota.git'
            }
        }

        stage('Shutdown Service') {
            steps {
                sh 'sudo docker stop proja-apps'
                sh 'sudo docker rmi -f proja:latest'
            }
        }

        stage('Build Image') {
            steps {
                sh 'sudo docker build -t proja:latest .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'sudo docker run -p 3000:3000 --name proja-apps proja:latest'
                sh 'echo "Deploying application..."'
            }
        }

        stage('Finish') {
            steps {
                sh 'echo "Complete deployment..."'
            }
        }
    }

    post {
        success {
            echo 'Pipeline berhasil dijalankan!'
        }
        failure {
            echo 'Pipeline gagal!'
        }
    }
}