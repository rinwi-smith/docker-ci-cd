pipeline {
    agent any

    environment {
        PROJECT_DIR = '/c/ProgramData/Jenkins/.jenkins/workspace/docker-ci-cd' // Jenkins workspace path in Unix format
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
                    // Build the Docker image using Docker Compose
                    bat 'docker-compose build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run tests using Docker Compose
                    bat 'docker-compose run app npm install'
                    bat 'docker-compose run app npm test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy using Docker Compose
                    bat 'docker-compose run app npm run deploy'
                }
            }
        }
    }
}
