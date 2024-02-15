pipeline{
  agent any
  tools{
    maven "maven"
  }
  stages{
    stage("git clone"){
      steps{
        git branch: 'main', url: 'http://github.com/gopi720/urotaxi.git'
      }
    }
    stage("build project"){
      steps{
        sh 'mvn clean verify'
      }
    }
    stage("sonarscanner"){
      steps{
        script{
          withSonarQubeEnv(credentialsId: 'urotaxi_sonarqube') {
            sh 'mvn sonar:sonar'
          }  
        }
      }
    }
    stage("docker image build"){
      steps{
        script {
          withCredentials([usernameColonPassword(credentialsId: 'docker', variable: 'docker')]) {
            sh 'docker image build -t gopidharani/urotaxi:2.0 .'
          }
        }
      }
    }
    stage("docker image push"){
      steps{
        script {
          withCredentials([usernameColonPassword(credentialsId: 'docker', variable: 'docker')]) {
            sh 'docker push  gopidharani/urotaxi:2.0'
          }
        }
      }
    }
  }
}
