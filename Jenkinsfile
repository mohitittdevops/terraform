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
                withAWS(credentials: 'd6ff9dfc-6cda-4d1e-a8c8-c47b785e178b') {
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

