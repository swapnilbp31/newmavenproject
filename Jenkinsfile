pipeline {
    agent any
    environment {
        KUBECONFIG_CONTENT = credentials('Jenkins_Key') // Your kubeconfig Secret Text credential ID
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
        stage('Debug Kubeconfig') {
    steps {
       script {
           withCredentials([string(credentialsId: 'Jenkins_Key', variable: 'KUBECONFIG_CONTENT')]) {
            script {
                // Write kubeconfig content to a file
                writeFile file: 'kubeconfig', text: KUBECONFIG_CONTENT
                
                // Set permissions and apply configuration
                sh '''
                chmod 600 kubeconfig
                kubectl apply -f service.yaml --kubeconfig=kubeconfig
                rm -f kubeconfig
                '''
        }
    }
       }
}}
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                    # Write kubeconfig content to a temporary file
                    echo "$KUBECONFIG_CONTENT" > kubeconfig
                    chmod 600 kubeconfig
                    
                    # Apply Kubernetes configuration
                    kubectl apply -f service.yaml --kubeconfig=kubeconfig

                    # Clean up temporary file
                    rm -f kubeconfig
                    '''
                }
            }
        }
    }
}
