pipeline {
    agent any

    parameters {
        string(
            name:"BRANCH_NAME",
            defaultValue: "main",
            description: "Nombre de la rama a compilar"
        )

        booleanParam(
            name: "COMPILE",
            defaultValue: false,
            description: "¿Desea desplegar en DEV?"
        )

        booleamParam(
            name: "RUN_TESTS",
            defaultValue: false,
            description: "¿Desea ejecutar pruebas unitarias?"
        )

        booleanParam(
            name: "DEPLOY_PRD",
            defaultValue: false,
            description: "¿Desea desplegar en PRD?"
        )
    }

    environment {
        DN_VERSION = "9.0"
    }
    
    stages {
        stage ('Clonar desde Github'){
            steps {
                checkout scmGit(branches: [[name: "*/${params.BRANCH_NAME}"]], extensions: [], userRemoteConfigs: [[credentialsId: '36d9b6ee-ebae-4d35-b11a-d6ada6a1d4a5', url: 'https://github.com/Linx92/bibllioteca-api-jenkinsfile-param.git']])
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
            when{
                expression{return params.COMPILE}
            }
            steps {
                script {
                    bat 'dotnet build --configuration Release'
                }
            }
        }

        stage ('Ejecutar pruebas unitarias'){
            when{
                expression{return params.RUN_TESTS}
            }
            steps {
                script {
                    bat 'dotnet test --configuration Release'
                }
            }
        }

        stage ('Deploy DEV') {
            steps{
                echo 'Despliegue Dev'
            }
        }
        
        stage ('Deploy PROD') {
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
