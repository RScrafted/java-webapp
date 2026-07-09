pipeline {
    agent {
        label 'built-in'
    }

    // Using Maven via Global Configuration
    // Tells Jenkins to auto-install and use this Maven version configured in Global Tool Configuration
    tools {
        maven 'Maven-3.9.16'
    }

    options {
        // Keeps the Jenkins server from running out of disk space
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
    }

    environment {
        APP_NAME = 'rs-shoe-apparel' // reference to pom.xml
        TOMCAT_CREDS = credentials('tomcat-manager-creds')
        // Note: TOMCAT_SERVER_IP and TOMCAT_SERVER_PORT environment variables must be configured globally 
        // in Jenkins under Manage Jenkins -> System -> Global properties
    }

    stages {
        // Continuous Integration
        stage('Checkout') {
            steps {
                // Get code from a GitHub repository
                checkout scm
            }
        }
        stage('Compile & Test') {
            steps {
                // Compiles Clean here, so we start fresh once
                sh 'mvn clean test'
            }
        }
        stage('Build & Package') {
            steps {
                // Reuses the compilation from above, speeding up the build
                echo "Building standard war package."
                sh 'mvn package -DskipTests'

                echo "Injecting build number into artifact name for tracking."
                // Renames the compiled war file to include the Jenkins build number
                sh "cp target/${APP_NAME}.war target/${APP_NAME}-v1.0.${BUILD_NUMBER}.war"
            }
            post {
                success {
                    echo 'Archiving production-ready WAR file to Jenkins controller.'
                    // Save the WAR as a Jenkins build artifact; fingerprint enables tracking across builds/jobs.
                    archiveArtifacts artifacts: 'target/*-v1.0.*.war', fingerprint: true
                }
            }
        }
        // Continuous Deployment
        stage('Deploy to Tomcat') {
            steps {
                echo 'Deploying standard war file via overwrite strategy...'
                // Uses the standard war name so Tomcat performs an in-place overwrite
                sh '''
                    curl -u ${TOMCAT_CREDS_USR}:${TOMCAT_CREDS_PSW} \
                    -T target/${APP_NAME}.war \
                    "http://${TOMCAT_SERVER_IP}:${TOMCAT_SERVER_PORT}/manager/text/deploy?path=/${APP_NAME}&update=true"
                '''
            }
        }
        stage('Smoke Test') {
            steps {
                echo "Validating deployment endpoint health..."
                // Ensures the pipeline fails immediately if Tomcat returns a 404 or 500
                sh '''
                    curl -fs "http://${TOMCAT_SERVER_IP}:${TOMCAT_SERVER_PORT}/${APP_NAME}/" || exit 1
                '''
            }
            post {
                success {
                    echo "Smoke test passed. Application context is healthy."
                }
                failure {
                    echo "ERROR: Smoke test failed! Application context is unreachable or returned an error code."
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline has finished.'
        }

        success {
            echo 'Build completed successfully.'
        }

        failure {
            echo 'Build failed.'
        }
    }
}