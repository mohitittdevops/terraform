pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
        stage('test AWS credentials') {
            steps {
                withAWS(credentials: 'AKIAT3VV3VFKWD4FDPWA') {
                    sh 'terraform plan'
                }
            }
        }
        stage('terraform plan') {
            steps{
                sh 'terraform plan'
            }
        }
    }
}

