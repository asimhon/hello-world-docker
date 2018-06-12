pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t hello-world .'
            }
        }
        stage('Test'){
            steps {
                sh 'dgoss run hello-world'
            }
        }
        stage('Package'){
            steps {
                sh 'eval $(aws ecr get-login --no-include-email --region us-west-2) && \
			docker tag hello-world 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world && \
			docker push 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world'
            }
        }
	stage('Deploy qal'){
            steps {
                sh 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-cluster1 && kubectl apply -f k8s/deploy-qal.yml --record && kubectl rollout status deploy hello-world-deploy'
            }
        }
	stage('Deploy prod'){
            steps {
                sh 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-cluster1 && kubectl apply -f k8s/deploy-prod.yml --record && kubectl rollout status deploy hello-world-deploy-prod'
            }
        }
    }
}
