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
                sh 'mvn package -DskipTests'
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