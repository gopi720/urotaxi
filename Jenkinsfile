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
        withCredentials([string(credentialsId: 'sonarqube', variable: 'sonarqube')]) {
          sh 'mvn sonar:sonar'  
        }
      }
    }
  }
}
