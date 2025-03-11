pipeline{
    agent any
    stages {
        stage ("git scm checkout")
        steps {
            git 'https://github.com/kumargaurav039/newmavenproject.git'
        }
    }
    stages {
        stage ("level-2")
        steps {
            sh 'echo mumbai'
        }
    }
    stages {
        stage ("level-3")
        steps {
            sh 'echo pune'
        }
    }
}


