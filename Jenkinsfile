pipeline {
  agent any
  stages {
    stage('scm checkout') {
      steps {
        git 'https://github.com/kumargaurav039/newmavenproject.git'
      }
    }

    stage('validate the code') {
      steps {

        withMaven(globalMavenSettingsConfig: '', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: '', traceability: true) {
        sh 'mvn validate'
        }
        
      }
    }

  }
}
