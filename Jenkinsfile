pipeline {
      agent any

      stages {
            stage('Checkout') {
                  steps {
                        git branch: 'main', url: 'https://github.com/rismapa/go-jenkins'
                  }
            }
            stage("Build") {
                  steps {
                        script{
                              // menggunakan jenkins untuk build image
                              sh 'docker build -t go-jenkins .'
                        }
                  }
            }
            stage("Test") {
                  steps {
                        script{
                              // Running test di dalam container
                              sh 'docker run go-jenkins go test -v ./...'
                        }
                  }
            }
            stage("Deploy") {
                  steps {
                        script{
                              // running container di server lokal
                              sh 'docker run -d --name go-jenkins-app go-jenkins'
                        }
                  }
            }
      }
}
