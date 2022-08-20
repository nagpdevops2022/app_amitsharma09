pipeline {
  agent any
  tools {
    nodejs "nodejs"
  }

  stages {
    stage('Build') {
      steps {
        sh 'npm i'
      }
    }

    stage('Test case execution') {
      steps {
        sh 'npm test'
      }
    }
  }
}