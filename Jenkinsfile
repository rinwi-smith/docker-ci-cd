pipeline {
    agent any
    
    environment {
        PROJECT_DIR = 'C:/Users/Dareal/OneDrive/Documents/projects/docker-ci-cd' // Adjusted to Linux path
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/rinwi-smith/docker-ci-cd.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build('my-node-app', '.')
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image('my-node-app').inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('my-node-app').inside {
                        sh 'npm run deploy'
                    }
                }
            }
        }
    }
}
