pipeline{
    agent any
    // install nodejs 20.17.0
    tools {
        nodejs "Nodejs20-17-0"
    }
    environment {
        // set the path to sonar-scanner
        SonarqubeHome = tool 'Sonarqube'
        //docker token
        Docker_Token = credentials('docker-token')
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
                        catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE'){
                            dir('app'){
                                script {
                                    sh 'npm audit --production --audit-level=high' // exit code defferent de 0 si il y a des vulnerabilites
                                }
                            }
                        }
                    }
                }
                stage( "owasp-scan"){
                    steps{
                        dir('app'){
                    //     dependencyCheck additionalArguments: '''
                    //     --scan './'
                    //     --out './'
                    //     --format 'ALL'
                    //     --prettyPrint
                    // ''', odcInstallation: 'Owasp dependency check'
                    sh ' echo "owasp-scan"'
                        }
                    }
                }
                }
                }
            stage ( ' test unitaires'){
                steps{
                    dir('app'){
                        script {
                            sh 'npm  run test' 
                        }
                    }
                }
            }
            // scanning code quality with sonarqube
            stage('Sonarqube-SAST'){

                steps{
                    dir('app'){
                        sh '''
                       $SonarqubeHome/bin/sonar-scanner \
                            -Dsonar.projectKey=SAST \
                            -Dsonar.sources=app.js \
                            -Dsonar.host.url=http://sonarqube-sonarqube-1:9000 \
                            -Dsonar.login=sqp_a06a63022106ff5dc8dcc074879ecd1a101c8163
                        '''
                    }
                }
            }
            stage('build docker image'){
                steps{
                    sh ' docker --version'
                    dir('app'){
                        script{
                            def commitid = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                            def imageName = "dahami03/app:${commitid}"
                            sh '''
                              docker build -t ${imageName} .
                              '''
                        }
                    }
                }
            }
            stage('push docker image'){
                steps{
                    script{
                        def commitid = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                        def imageName = "dahami03/app:${commitid}"
                        sh '''
                            docker login -u dahami03 -p $Docker_Token
                            docker push ${imageName}
                        '''
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

