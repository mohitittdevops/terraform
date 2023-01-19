pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        // stage('terraform format check') {
        //     steps{
        //         sh 'terraform fmt'
        //     }
        // }
        // stage('terraform Init') {
        //     steps{
        //         sh 'terraform init'
        //     }
        // }
        // stage('test AWS credentials') {
        //     steps {
        //         withAWS(credentials: 'd6ff9dfc-6cda-4d1e-a8c8-c47b785e178b' , region: 'us-east-1') {
        //             sh 'terraform plan'
        //         }
        //     }
        // }
        stage('terraform Commands') {
            // steps {
            //     withAWS(credentials: 'd6ff9dfc-6cda-4d1e-a8c8-c47b785e178b' , region: 'us-east-1') {
            //         sh 'terraform fmt'
            //         sh 'terraform init'
            //         //sh 'terraform apply --auto-approve'
            //         sh 'terraform apply --auto-approve'
            //     }
            // }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'd6ff9dfc-6cda-4d1e-a8c8-c47b785e178b', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}

