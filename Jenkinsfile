pipeline{
    agent any
    stages{
        stage('Load remote pipeline'){
            steps{
                dir('biblioteca-api-jenkins-remote'){
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/biblioteca-api-jenkins-remote.git', credentialsId: 'github-repo']]])
                    def buildAndTest = load 'pipelines/buildandtest.groovy'
                    buildAndTest('biblioteca-api-jenkins-remote')
                }
            }
        }
    }
}