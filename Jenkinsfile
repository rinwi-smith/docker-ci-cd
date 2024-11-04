pipeline {
    agent any

    environment {
        PROJECT_DIR = 'C:/Program Files/Jenkins/.jenkins/workspace/docker-ci-cd' // Windows path with escaped backslashes
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
                        bat 'npm install'  // Use bat for Windows
                        bat 'npm test'     // Use bat for Windows
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('my-node-app').inside {
                        bat 'npm run deploy'  // Use bat for Windows
                    }
                }
            }
        }
    }
}
