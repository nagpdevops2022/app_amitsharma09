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
          bat "${scannerHome}/bin/sonar-scanner begin /k:\"sonar-amitsharma09\" /d:sonar.verbose=true -d:sonar.cs.xunit.reportsPath='Tests/TestResults/sonar-amitsharma09TestFileReport.xml'"
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