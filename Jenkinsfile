pipeline {
  agent any

  environment{
    scannerHome = tool name: 'SonarQubeScanner'
    username = 'admin'
    appName = 'app_amitsharma09'
  }
  tools {
    nodejs "nodejs"
  }

  stages {
    stage('Build') {
      steps {
        bat 'npm i'
      }
    }

    stage('Start Sonarqube Analysis') {
      when {
              branch 'develop'
            }
      steps {
        echo "Starting Sonarqube Analysis."
        withSonarQubeEnv('Test_Sonar'){
          bat "${scannerHome}/bin/sonar-scanner \
           -Dsonar.projectKey=sonar-amitsharma09"
          // bat "${scannerHome}/bin/sonar-scanner \
          //  -Dsonar.projectKey=sonar-amitsharma09 \
          //  -Dsonar.sources=. \
          //  -Dsonar.css.node=. \
          //  -Dsonar.host.url=http://localhost:9000"
          //  -Dsonar.login=c54ad48e7bcee5e569e74e0702555e57f9bbb71a"
        }
      }
    }
    stage('TestCase Execution') {
      when {
              branch 'master'
            }
        steps{
          bat 'npm test'
        }
    }
  }
}