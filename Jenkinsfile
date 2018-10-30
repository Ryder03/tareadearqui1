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
              sh '''
                heroku container:login
                docker build -t registry.heroku.com/vamosquesepuede/web .
                docker push registry.heroku.com/vamosquesepuede/web
                heroku container:release web -a vamosquesepuede
                heroku open -a vamosquesepuede
              '''
            }
       }

    }
}
