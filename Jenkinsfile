pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-python-project:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Bhavesh0316/my_python_project.git'
            }
        }

        stage('Build Wheel') {
            steps {
                sh 'ls -la'  // Debugging: Check if pyproject.toml exists
                sh 'python3 -m build --wheel'
            }
        }

        stage('Test') {
            steps {
                sh 'pip install pytest'
                sh 'pytest tests/'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-python-project:latest .'
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
