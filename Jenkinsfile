pipeline {
    agent any

    stages {

       stage ('Clone sources') {
            steps {
              git 'https://github.com/Ryder03/tareadearqui1.git'
            }
       }

        stage ('Build') {
            steps {
                echo 'Building..'
            }
        }

       stage ('Deploy') {
            steps {
              echo 'deploy'
            }
            steps {
              sh 'heroku container:login'
            }
            steps {
              sh 'docker build -t registry.heroku.com/vamosquesepuede/web .'
            }
            steps {
              sh 'docker push registry.heroku.com/vamosquesepuede/web'
            }
            steps {
              sh 'heroku container:release web -a vamosquesepuede'
            }
            steps {
              sh 'heroku open -a vamosquesepuede'
            }

       }

    }
}
