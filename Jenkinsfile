pipeline {
    agent java-build-agent
    stages {
        stage('show versions') {
            steps {
                script {
                    sh "docker --version"
                    sh "docker ps"
                }
            }
        }
        stage('checkout repo') {
            steps {
              git branch: "master", url: "https://github.com/airbornum/dz-java-app-docker-client.git"

            }
        }


        stage('build') {
            steps {
                script {
                    echo "Building the application..."
                    sh "cd ./dz-java-app-docker-client"
                    sh "docker build -t airbornum/java-app-docker:latest ."
                }
            }
        }

        stage('push app to dockerhub') {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
          app.push("airbornum/java-app-docker:latest")
        }
      }

        stage('deploy app') {
            steps {
                script {
                    echo "Run the application..."
                    sh "docker run -d -it -p 8888:8080/tcp --name java-app-docker airbornum/java-app-docker:latest"
                }
            }
        }


    }
}
