pipeline {
    agent any
    environment {

        IMAGE_NAME = "rushikeshshelke1542/angular-app/angular-frontend"
        BUILD_ID_TAG = "${BUILD_ID}"
    }
    stages {
        stage('Checkout Code') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/rushikeshshelke1542/angular-realworld-example-app-main.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("${IMAGE_NAME}:${BUILD_ID_TAG}")
                    env.APP_IMAGE = "${IMAGE_NAME}:${BUILD_ID_TAG}"
                    sh 'which docker'
                    sh 'docker --version'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        def app = docker.image(env.APP_IMAGE)
                        app.push(BUILD_ID_TAG)
                        app.push("latest") // Optional: Tag as latest
                    }
                }
            }
        }
    }
}
