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
            echo 'Pakage deployed Successfull'
         }
      }
   } 
}
