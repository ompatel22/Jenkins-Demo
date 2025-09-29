pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'ls -R' // debug to see file paths
            }
        }
        stage('Compile Java') {
            steps {
                sh 'javac src/Main.java'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ompatel22/docker-jenkins-java .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh "docker login -u '$DOCKERHUB_USERNAME' -p '$DOCKERHUB_PASSWORD'"
                    sh 'docker push ompatel22/docker-jenkins-java'
                    sh 'docker logout'
                }
            }
        }
    }
}
