pipeline {
    agent { label 'windows'}
    
    environment {
        DN_VERSION = "9.0"
    }
    
    stages {
        stage ('Clonar desde Github'){
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '36d9b6ee-ebae-4d35-b11a-d6ada6a1d4a5', url: 'https://github.com/Linx92/biblioteca-api-jenkins.git']])
            }
        }
    
    
        stage ('Restaurar dependencias'){
            steps {
                script {
                    bat 'dotnet restore'
                }
            }
        }
    
        stage ('Compilar'){
            steps {
                script {
                    bat 'dotnet build --configuration Release'
                }
            }
        }

        stage ('Deploy DEV') {
            when {
                branch 'develop'
            }
            steps{
                echo 'Despliegue Dev'
            }
        }
        
        stage ('Deploy PROD') {
            when {
                branch 'main'
            }
            steps{
                input message: '¿Autoriza la ejecución?'
                echo 'Despliegue PROD'
            }
        }
    }    

    post {
        always {
            cleanWs()
        }
        success {
            echo "Compilación correcta"
        }
        failure {
            echo "Error en compilación"
        }
    }
}
