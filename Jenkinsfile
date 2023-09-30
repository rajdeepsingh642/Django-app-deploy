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
                withCredentials([string(credentialsId: 'docker_hubss', variable: 'docker_hub')]) {

        	     sh "docker login -u rajdeepsingh642 -p ${docker_hub}"
                 sh 'docker push rajdeepsingh642/djangoapp:${BUILD_ID}'
                   }
            }
        }   
             stage("Sending k8s file to ansible server"){
            steps{
                sshagent(['ansible_host']) {
                    sh 'ssh -o StrictHostKeyChecking=no raj@192.168.1.29'
                    sh 'scp /var/lib/jenkins/workspace/django-app/djangoapp/* raj@192.168.1.29:/opt/'
                  }
                
                }
            }
        
        stage('Ansible to configure server'){
                  steps{
                    dir('ansible/') {
                        
                        sh 'ansible-playbook ansible.yml'
                        
                        }


                  }
                 }
        
    }
    
}