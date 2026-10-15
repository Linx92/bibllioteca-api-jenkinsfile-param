pipeline{
    agent any
    stages{
        stage('Load remote pipeline'){
            steps{
                script{
                    dir('biblioteca-api-jenkins-remote'){
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/Linx92/bibllioteca-api-jenkinsfile-remote.git', credentialsId: 'github-repo']]])
                    }
                    def buildAndTest = load 'biblioteca-api-jenkins-remote/pipelines/buildandtest.groovy'
                    buildAndTest.call('biblioteca-api-jenkins-remote')

                }

            }
        }
    }
}