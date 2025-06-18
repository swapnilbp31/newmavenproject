pipeline {
    agent any
    environment {
        KUBECONFIG = credentials('Jenkins_Key') // Use your kubeconfig file ID
    }
    stages {
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/swapnilbp31/newmavenproject.git'
            }
        }
        stage('Config Maven') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_Home', maven: 'Maven_Home', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Package') {
            steps {
                echo 'Package Successful'
            }
        }
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t swapnilbp/devops923:v2 .'
            }
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                withDockerRegistry(credentialsId: 'Docker_hub', url: 'https://index.docker.io/v1/') {
                    sh 'docker push swapnilbp/devops923:v2'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    
                    kubectl apply -f service.yaml
                    '''
                }
            }
        }
    }
}
