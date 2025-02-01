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
                sh 'docker stop proja-apps && docker rm proja-apps' 
                sh 'docker rmi -f proja:latest' 
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t proja:latest .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 3000:3000 --name proja-apps proja:latest'  // Gunakan "-d" untuk menjalankan container di background
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