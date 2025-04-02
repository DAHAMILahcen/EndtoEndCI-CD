pipeline{
    agent any
    tools {
        nodejs "nodejs-18"
    }
    stages{
        stage('Install Dependencies'){
            steps{
                dir('app'){
                    script {
                        sh 'npm install --no-audit' 
                    }
                }
            }
        }
    }
    post{
        success {
            echo 'Pipeline exécuté avec succès!'
        }
        failure {
            echo 'Échec du pipeline!'
        }
    }
      
}

