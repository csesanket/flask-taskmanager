pipeline {
    agent any
    triggers {
        // Poll for changes every 2 minutes, modify as needed
        pollSCM('H/2 * * * *')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-taskmanager .'
            }
        }
        stage('Deploy Container') {
            steps {
                // Stop and remove the previous container, if exists
                sh 'docker rm -f flask-app || true'
                // Start the new container
                sh 'docker run -d --name flask-app -p 5000:5000 flask-taskmanager'
            }
        }
    }
}
