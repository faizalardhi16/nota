pipeline {
    agent any

    tools {
        nodejs 'Node JS 22' // Sesuaikan dengan nama Node.js yang dikonfigurasi di Jenkins
    }

    environment {
        DOCKER_IMAGE = 'proja:latest'
        CONTAINER_NAME = 'proja-apps'
        REPO_URL = 'https://github.com/faizalardhi16/nota.git' // Gunakan SSH URL untuk menghindari masalah autentikasi
        BRANCH_NAME = 'master'
    }

    stages {
        stage('Checkout') {
            steps {
                // Menggunakan SSH untuk mengakses repositori GitHub
                git branch: "${BRANCH_NAME}", url: "${REPO_URL}"
            }
        }

        stage('Shutdown Service') {
            steps {
                script {
                    // Memastikan container tidak berjalan sebelum memulai build baru
                    sh 'docker ps -q -f name=${CONTAINER_NAME} | xargs -r docker stop' // Memastikan container sudah dihentikan
                    sh 'docker ps -a -q -f name=${CONTAINER_NAME} | xargs -r docker rm'  // Menghapus container yang lama
                    sh 'docker rmi -f ${DOCKER_IMAGE}'  // Menghapus image lama
                }
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'  // Membangun Docker image baru
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -p 3000:3000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}'  // Menjalankan container dari image baru
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
