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
  }
}
