pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-python-project:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Bhavesh0316/my_python_jenkins.git'
            }
        }

        stage('Build Wheel') {
    steps {
        dir('/var/lib/jenkins/workspace/dummypython') {  // Correct directory
            sh 'ls -la'  // Debugging: List files
            sh 'pwd'     // Debugging: Show current directory
            sh 'python3 -m build --wheel --outdir dist'
        }
    }
}



        stage('Test') {
            steps {
                sh 'pip install pytest'
                sh 'pytest tests/'
            }
        }

        stage('Build Docker Image') {
    dir('/var/lib/jenkins/workspace/dummypython') {  // Ensure the correct directory
        sh 'docker build -t my-python-app:latest .'
    }
}



        stage('Deploy') {
            steps {
                sh 'docker stop my-python-container || true'
                sh 'docker rm my-python-container || true'
                sh 'docker run -d --name my-python-container my-python-project:latest'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
