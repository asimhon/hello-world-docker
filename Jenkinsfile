pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t hello-world .'
            }
        }
        stage('Tests'){
            steps {
                sh 'dgoss run hello-world'
            }
        }
        stage('Publish Docker'){
            steps {
                sh 'eval $(aws ecr get-login --no-include-email --region us-west-2) && \
			docker tag hello-world 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world && \
			docker push 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world'
            }
        }
	stage('Deploy to qal'){
            steps {
                sh 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-cluster1 && kubectl apply -f k8s/deploy-qal.yml --record && kubectl rollout status deploy hello-world-deploy-qal'
            }
        }
	stage('qal tests'){
            steps {
                sh 'tests/test-response.sh qal'
            }
        }
	stage('Deploy Prod'){
            steps {
                sh 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-cluster1 && kubectl apply -f k8s/deploy-prod.yml --record && kubectl rollout status deploy hello-world-deploy-prod'
            }
        }
	stage('Production tests'){
            steps {
                sh 'tests/test-response.sh prod'
            }
        }
    }
}
