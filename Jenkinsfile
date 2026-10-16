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

        stage('Deploy to App Service'){
            steps{

                withCredentials([azureServicePrincipal('3f790d25-6b8a-4bdc-990b-d7236371470a')]) {
                    bat 'whoami'
                    bat 'hostname'
                    bat 'echo %PATH%'
                    bat 'where az'
                    bat 'az login --service-principal -u %AZURE_CLIENT_ID% -p %AZURE_CLIENT_SECRET% --tenant %AZURE_TENANT_ID%'
                    bat 'az webapp deploy --resource-group AZ-204-Linford --name test-jenkins-api --src-path publish --type zip'
                }     
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