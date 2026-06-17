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
        maven 'Maven'
    }
    steps {
        sh 'mvn clean package -DskipTests'
    }
}

//         stage('Test') {
//             tools {
//                 maven 'Maven3'
//             }
//             steps {
//                 sh 'mvn test'
//             }
//         }

        stage('Build Docker image') {
            steps {

                script {
                sh '''
                export PATH=$PATH:/Users/jiyanivanshi/.rd/bin
                docker version
                docker build -t order-service .
                '''                }
            }
        }
        stage('Archive') {
            tools {
                maven 'Maven'
            }
            steps {
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }
    }
}