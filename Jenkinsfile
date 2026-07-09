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