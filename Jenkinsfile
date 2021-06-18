pipeline {
    agent java-build-agent
    stages {
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                }
            }
        }
        stage('build') {
            steps {
                script {
                    echo "Building the application..."
                    sh "docker build -t airbornum/java-app-docker:latest ."
                }
            }
        }
        stage('push') {
            steps {
                script {
                    echo "Push the application..."
                    sh "docker push airbornum/java-app-docker:latest"
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo "Run the application..."
                    sh "docker run -d -it -p 8888:8080/tcp --name java-app-docker airbornum/java-app-docker:latest"
                }
            }
        }


    }
}
