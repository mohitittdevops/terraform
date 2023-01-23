pipeline {
    agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Create Infra') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'd6ff9dfc-6cda-4d1e-a8c8-c47b785e178b', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform init'
                    //sh 'terraform apply --auto-approve'
                    sh 'terraform destroy --auto-approve'
                }
            }
        }
    }
}

