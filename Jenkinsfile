pipeline {
    agent any
    stages {
        stage('Build with Maven') {
            steps {
                // Use the Maven Wrapper to build the JAR file.
                // This is a best practice as it doesn't require installing Maven on the Jenkins agent.
                sh './mvnw clean package -DskipTests'
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