pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        CLUSTER_NAME = 'kimit-demo'
       // CHART_PATH = 'three-tier-app'
        RELEASE_NAME = 'three-tier'
        NAMESPACE = 'three-tier'
    }

    stages {
        stage('Checkout') {
           steps {
                checkout scm
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
                helm version
                helm upgrade --install $RELEASE_NAME . \
                    --namespace $NAMESPACE \
                    --create-namespace \
                    --set frontend.image=my-frontend:${BUILD_NUMBER} \
                    --set backend.image=my-backend:${BUILD_NUMBER}
                '''
            }
        }
    }
}
