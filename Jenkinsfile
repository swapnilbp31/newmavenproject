pipeline {
  agent any
  stages {
    stage('scm checkout') {
      steps {
        git 'https://github.com/kumargaurav039/newmavenproject.git'
      }
    }

    stage('print your message') {
      steps {
        sh 'echo hello'
      }
    }

  }
}
