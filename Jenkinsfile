pipeline{
    agent any
    tools{
        maven 'maven'
        jdk 'jdk21'
        }
        environment {
        DOCKER_IMAGE = "shrikrushna1407/myfirstapplication-0.0.1-snapshot"
        }
    stages{
        stage('Build_Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Shrikrushna1407/devops-integration']])
                bat 'mvn clean install'
                }
        }
        stage('Docker Build') {
            steps{
                script{
                    bat "docker build -t %DOCKER_IMAGE% ."
                      }
            }
    }
    stage('Push Image to Docker Hub'){
        steps{
            script{
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                bat 'docker login -u shrikrushna1407 -p Krishna@123'
}
                bat 'docker push  %DOCKER_IMAGE%'
            }
        }
    }
    stage('Deploy to Kubernetes') {
                steps {
                    script {
                        // Apply the Kubernetes manifests
                        bat "kubectl apply -f deploymentservice.yaml"
                    }
                }
}
}