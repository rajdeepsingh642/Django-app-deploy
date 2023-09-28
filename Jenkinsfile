pipeline {
    agent any

    
    stages{
        stage('Code'){
            steps{
                 git branch: 'master', url:'https://github.com/rajdeepsingh642/Django-app-deploy.git'
            }
        }
        stage('Build'){
            steps{
                 sh 'docker build -t rajdeepsingh642/djangoapp:${BUILD_ID} .'
            }
        }
        stage('Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                 sh 'docker push rajdeepsingh642/djangoapp:${BUILD_ID}'
                }
            }
        }
      
            }
        }
    }
    }
