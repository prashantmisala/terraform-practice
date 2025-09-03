pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
        TF_VAR_env         = "rnd"   // pass environment to Terraform
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prashantmisala/terraform-practice.git'
            }
        }

        stage('Init') {
            steps {
                sh """
                  terraform init -input=false
                """
            }
        }

        stage('Validate') {
            steps {
                sh """
                  terraform validate
                """
            }
        }

        stage('Plan') {
            steps {
                sh """
                  terraform plan -var-file=env/${TF_VAR_env}/variable.tfvars -out=tfplan
                """
            }
        }

        stage('Apply') {
            when {
                branch 'main'  // apply only on main branch
            }
            steps {
                // input message: "Do you want to apply Terraform changes?"
                sh """
                  terraform apply -input=false tfplan
                """
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/terraform.tfstate', fingerprint: true
        }
        success {
            echo "Terraform pipeline completed successfully!"
        }
        failure {
            echo "Terraform pipeline failed!"
        }
    }
}
