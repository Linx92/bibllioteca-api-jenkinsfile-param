@Library('shared-library-2026@main') _

pipeline{
    agent any

    stages{
        stage('Restore Dependencies'){
            steps{
                dotnetrestore solution: 'BibliotecaApi.sln'
            }
        }
        stage('Build'){
            steps{
                dotnetbuild solution: 'BibliotecaApi.sln', configuration: 'Release'
            }
        }
        stage('Test'){
            steps{
                dotnettest solution: 'BibliotecaApi.sln', configuration:'Release'
            }
        }
        stage('Publish'){
            steps{
                dotnetpublish solution: 'BibliotecaApi.sln', configuration: 'Release', outputdir: 'publish'
                archiveArtifacts artifacts: 'publish/**', fingerprint: true
            }
        }
    }
    // stages{
    //     stage('Load remote pipeline'){
    //         steps{
    //             script{
    //                 dir('biblioteca-api-jenkins-remote'){
    //                 checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/Linx92/bibllioteca-api-jenkinsfile-remote.git', credentialsId: 'github-repo']]])
    //                 }
    //                 def buildAndTest = load 'biblioteca-api-jenkins-remote/pipelines/buildandtest.groovy'
    //                 buildAndTest.call('biblioteca-api-jenkins-remote')

    //             }

    //         }
    //     }
    // }
}