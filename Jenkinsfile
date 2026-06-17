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
                    sh 'docker build -t a418faf43db4/order-service .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u a418faf43db4 -p ${dockerhubpwd}'

}
                   sh 'docker push a418faf43db4/order-service'
                }
            }
        }
        stage('Deploy to k8s'){
                    steps{
                        script{
         withCredentials([file(credentialsId: 'k8sconfigpwd', variable: 'KUBECONFIG')]) {
                    sh '''
                        export KUBECONFIG=$KUBECONFIG
                        kubectl apply -f app-deployment.yaml
                    '''
                }                }
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