pipeline {
    agent any
    stages {
        stage('git-code-download') {
            steps {
                echo "Download code from Git"
                git branch: 'main', url: 'https://github.com/patelasmi/maven-jenkins6.git'
            }
        }
        stage('create-docker-image') {
            steps {
                sh '''
                docker build -t patelasmi/mytomcat:${BUILD_NUMBER} .
                docker tag patelasmi/mytomcat:${BUILD_NUMBER} patelasmi/mytomcat:latest
                docker push patelasmi/mytomcat:${BUILD_NUMBER}
                docker push patelasmi/mytomcat:latest
                '''
            }
        }
    }
}
