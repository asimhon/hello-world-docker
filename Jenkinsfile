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
                sh '/usr/local/bin/dgoss run hello-world'
            }
        }
        stage('Publish Artifact'){
            steps {
                sh 'eval $(aws ecr get-login --no-include-email --region eu-west-1) && \
			docker tag hello-world 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world && \
			docker push 467269547207.dkr.ecr.us-west-2.amazonaws.com/hello-world'
            }
        }
    }
}
