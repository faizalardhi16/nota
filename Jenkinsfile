pipeline {
    agent any

    tools {
        nodejs 'Node JS 22' // Sesuaikan dengan nama Node.js yang dikonfigurasi di Jenkins
    }

    environment{
        BRANCH = 'master'
        URL = 'https://github.com/username/nota.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: BRANCH, url: URL 
            }
        }

        stage('Shutdown Service') {
            steps {
                sh 'docker stop proja-apps'
                sh 'docker rmi -f proja:latest'
            }
        }

        stage('Build Image') {
            steps {
                def tags = 'latest'
                sh 'docker build -t proja:${tags} .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -p 3000:3000 --name proja-apps proja:latest'
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