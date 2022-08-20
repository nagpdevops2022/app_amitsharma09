pipeline {
  agent any
  tools {
    nodejs "nodejs"
  }

  stages {
    stage('Build') {
      steps {
        bat 'npm i'
      }
    }

    stage('Test case execution') {
      when {
              branch 'develop'
            }
      steps {
        bat 'npm test'
      }
    }
  }
}