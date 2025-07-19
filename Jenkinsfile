pipeline {
    agent { label 'c' }
    stages {
        stage(git) {
            steps {
                echo "cloning..."
                git 'https://github.com/Akhil-2134/addressbook.git' 
            }
        } 
        stage(build) {
            steps {
                echo "buliding..."
                sh 'mvn compile'
            }
        } 
        stage(test) {
            steps {
                echo "testing..."
                sh 'mvn test'
            }
        }
        stage(install) {
            steps {
                echo "install..."
                sh 'mvn install'
                archiveArtifacts artifacts: 'target/addressbook.war', followSymlinks: false
            }
        }
    }
}
