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
                    sh 'docker build -t order-service .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u a418faf43db4 -p ${dockerhubpwd}'

}
                   sh 'docker push order-service-1.0'
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