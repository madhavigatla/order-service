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
                echo "PATH=$PATH"
                which docker || true
                /usr/local/bin/docker version || true
                '''
                               }
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