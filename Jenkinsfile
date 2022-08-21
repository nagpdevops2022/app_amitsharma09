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
        // bat 'gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project quick-doodad-360010'
        // bat 'kubectl apply -f K8s/Deployment.yaml'
        bat 'kubectl --kubeconfig=C:/Users/amitsharma09/.kube/config apply -f K8s/Deployment.yaml'
        // bat 'kubectl --kubeconfig=%USERPROFILE%/.kube/config apply -f K8s/Deployment.yaml'
      }
    }
  }
}
