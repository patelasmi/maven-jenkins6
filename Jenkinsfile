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
                docker build -t asmi080497/mytomcat:${BUILD_NUMBER} .
                docker tag asmi080497/mytomcat:${BUILD_NUMBER} asmi080497/mytomcat:latest
                docker push asmi080497/mytomcat:${BUILD_NUMBER}
                docker push asmi080497/mytomcat:latest
                '''
            }
        }
    }
}
