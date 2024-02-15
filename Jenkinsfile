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
          sh 'docker build -t gopidharani/urotaxi:2.0 .'
        }
      }
    }
  }
}
