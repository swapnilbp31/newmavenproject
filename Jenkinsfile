pipeline{
   agent any
   stages{
      stage('SCM Checkout'){
         steps{
             git 'https://github.com/swapnilbp31/newmavenproject.git'
         }
      }
      stage('config Maven'){
         steps{
            withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_Home', maven: 'Maven_Home', mavenSettingsConfig: '', traceability: true) {
    sh 'mvn clean package'
}
         }
      }
      stage('Package'){
         steps{
            echo 'Pakage  Successfull'
         }
      }
       stage('create docker image') {
      steps {
        sh 'docker build -t swapnilbp/devops923:latest .'
      }
    }
    stage('push docker image to dockerhub') {
      steps {
        
        withDockerRegistry(credentialsId: 'Docker_hub', url: 'https://index.docker.io/v1/') {
            
                sh 'docker push swapnilbp/devops923:latest'
            
        }
      }
   } 
}
