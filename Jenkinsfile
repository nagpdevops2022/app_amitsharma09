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
          bat "${scannerHome}/bin/sonar-scanner begin -X"
          // bat '${scannerHome}/bin/sonar-scanner -D"sonar.projectKey=sonar-amitsharma09" -D"sonar.sources=." -D"sonar.host.url=http://localhost:9000" -D"sonar.login=c54ad48e7bcee5e569e74e0702555e57f9bbb71a"'
        }
      }
    }
    stage('TestCase Execution') {
        steps{
          bat 'npm test'
        }
    }
    stage('Stop Sonarqube Analysis') {
        steps{
          echo "Stopping Sonarqube Analysis."
          bat "${scannerHome}/bin/sonar-scanner end"
        }
    }
  }
}