pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Hello World'
                git 'https://github.com/hackerboypk/Calculator.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Hello World'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t calculator:latest .' 
                sh 'docker tag calculator hackerboypk/calculator:$BUILD_NUMBER'
                
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push hackerboypk/calculator:$BUILD_NUMBER'
         
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 hackerboypk/calculator"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@16.170.218.238 run -d -p 8003:8080 hackerboypk/calculator"
 
            }
        }
    }
}
