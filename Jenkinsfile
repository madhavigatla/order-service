pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

stage('Build') {
    tools {
        maven 'Maven3'
    }
    steps {
        sh 'mvn clean package -DskipTests'
    }
}

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }
    }
}