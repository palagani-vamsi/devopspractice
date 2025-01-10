pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub-cred') {
                        sh 'docker build -t gsaiadhinathareddy/recommendationservice:v1 .'
                    }
                }
            }
        }
        stage('Push') {
            step {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub-cred') {
                        sh 'docker push gsaiadhinathareddy/recommendationservice:v1'
                    }
                }
            }
        }
    }
}
