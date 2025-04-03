pipeline{
    agent any
    // install nodejs 20.17.0
    tools {
        nodejs "Nodejs20-17-0"
    }
    stages{
        // install dependencies
        stage('Install Dependencies'){
            steps{
                dir('app'){
                    script {
                        sh 'npm install --no-audit' 
                    }
                }
            }
        }
       // dependecies scanning
        stage('dependecies scanning'){
            parallel{
                stage(' scanne dependencies avec npm audit'){
                    steps{
                        dir('app'){
                            script {
                                sh 'npm audit --production --audit-level=critical' || true 
                            }
                        }
                    }
                }

                stage( "owasp-scan"){
                    steps{
                        dir('app'){
                        dependencyCheck additionalArguments: '''
                        --scan './'
                        --out './'
                        --format 'ALL'
                        --prettyPrint
                    ''', odcInstallation: 'Owasp dependency check'
                        }
                    }
                }
                }
                }
            stage ( ' test unitaires'){
                steps{
                    dir('app'){
                        script {
                            sh 'npm test' 
                        }
                    }
                }
            }
    }
                    
    // post build
    post{
        success {
            echo 'Pipeline exécuté avec succès!'
        }
        failure {
            echo 'Échec du pipeline!'
        }
    }
      
}

