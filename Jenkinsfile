pipeline {
    agent any
    environment {
        scannerHome = tool name: 'sonar-scanner'
        SONAR_TOKEN = credentials('jenkins-sonar')
    }
    stages {
        stage('Obtener el proyecto') {
            steps {
                git branch: 'main', poll: false, url: 'https://github.com/EnriqueTun23/1640-LOCAL-ORDER-ADMI.git'
            }
        }
        stage('Entrar ala carpeta cobol') {
            steps {
                script {
                    dir('.') {
                    echo 'Entrando ala carpeta cobol para scannear'
                    sh 'pwd'
                    
                    }
                }
            }
        }
        stage('Scanner cobol') {
            steps {
                withSonarQubeEnv('sc1') {
                    dir ('Codigo/Cobol') {
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.login=${SONAR_TOKEN} \
                        -X
                    """
                    }
                    
                }
            }
        }
        // stage('Regresar ala carpeta principal') {
        //     steps {
        //         script {
        //             echo 'Regresar ala carpeta principal y entrar a c++'
        //             sh 'pwd'
        //             sh 'cd ../..'
        //             sh 'chmod +x ./Codigo/C++/compile.sh'
        //             sh 'cd ./Codigo/C++'
        //             sh 'chmod +x $SONARQUBE_WRAPPER/build-wrapper-linux-x86-64'
        //             sh 'ls -a'
        //             sh '$SONARQUBE_WRAPPER/build-wrapper-linux-x86-64 --out-dir bw-output ./compile.sh'
        //         }
        //     }
        // }
        stage('Regresar ala carpeta principal') {
            steps {
                script {
                    dir('Codigo/C++') {
                        sh 'pwd'
                        sh 'chmod +x ./compile.sh'
                        sh 'ls -a'
                        sh '$SONARQUBE_WRAPPER/build-wrapper-linux-x86-64 --out-dir bw-output ./compile.sh'
                }
            }
        }

        
    }
}