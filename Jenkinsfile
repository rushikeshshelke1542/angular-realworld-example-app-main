pipeline {
    agent any
    environment {
        IMAGE_NAME = "rushikeshshelke1542/angular-app/angular-frontend"
        BUILD_ID_TAG = "${BUILD_ID}"
    }
    stages {
        stage('Checkout Code') {
            steps {
                retry(3){
                    
                git branch: 'main', url: 'https://github.com/rushikeshshelke1542/angular-realworld-example-app-main.git'
            }
            }
        }
        stage('Build Angular App') {
            steps {
                sh 'npm install'
                sh 'npm run build --prod'

            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_ID_TAG .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $IMAGE_NAME:$BUILD_ID_TAG'
                }
            }
        }
    }
}
