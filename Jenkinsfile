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
              branch 'master'
            }
      steps {
        bat 'npm test'
      }
    }
    stage('Kubernetes Execution') {
      steps {
        bat 'gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project quick-doodad-360010'
        // bat 'whoami'
        bat 'kubectl apply -f K8s/Deployment.yaml'
      }
    }
  }
  post{
   always{
            echo 'I am awsome. I run always'
        }
        success{
            echo 'success'
        }
        failure{
             echo 'failing.'
        }    
    //    changed{ squ_dbe138c55e8feccac167c2a053d72b3fe6231deb
    //         echo 'I run when you are fail.'  sqp_c18f63960a2505f4912fbde8ae301342d4ef4a84
    //     }
    }
}
