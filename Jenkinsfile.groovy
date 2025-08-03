pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        CLUSTER_NAME = 'my-eks-cluster'
        CHART_PATH = 'three-tier-app'
        RELEASE_NAME = 'three-tier'
        NAMESPACE = 'default'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main' ,'https://github.com/ShoroukNabil/EKS-helm.git'
            }
        }

        stage('Configure AWS and EKS') {
            steps {
                sh '''
                aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
                kubectl get nodes
                '''
            }
        }

        stage('Helm Deploy') {
            steps {
                sh '''
                helm upgrade --install $RELEASE_NAME $CHART_PATH \
                    --namespace $NAMESPACE \
                    --set frontend.image=my-frontend:${BUILD_NUMBER} \
                    --set backend.image=my-backend:${BUILD_NUMBER}
                '''
            }
        }
    }
}
