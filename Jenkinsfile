pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')     // Jenkins Credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // Jenkins Credential ID
        AWS_DEFAULT_REGION    = 'us-east-2'                           // AWS region (Ohio)
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Maheshchemmala1992/Automatic-Application-Deployment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "✅ Terraform deployment successful!"
        }
        failure {
            echo "❌ Terraform deployment failed!"
            script {
                // Optional: show extra info if something goes wrong
                sh 'terraform --version || true'
                sh 'ls -la || true'
                sh 'echo "Check if all required files exist and credentials are correct."'
            }
        }
    }
}
