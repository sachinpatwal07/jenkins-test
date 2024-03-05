pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('sachin-docker')
        IMAGE_NAME = "sachinpatwal30/my_node_app"
    }

    stages {
        stage('Build Image') {
            steps {
                script {
                    docker.build `${IMAGE_NAME}:${BUILD_NUMBER}`
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/v2/', "sachin-docker") {
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }

    post {
        always {
            sh "docker logout"
        }
        success {
            script  {
               cleanWs()
            }
        }
    }
}