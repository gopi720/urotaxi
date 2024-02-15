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
          docker.withRegistry('',docker){
            docker_image = docker.build "gopidharani/urotaxi:2.0"
            docker_image.push("gopidharani/urotaxi:2.0")
          }
        }
      }
    }
  }
}
