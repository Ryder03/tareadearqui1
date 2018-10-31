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
                heroku login
                heroku container:login
                docker build -t registry.heroku.com/tareadearquitectura/web .
                docker push registry.heroku.com/tareadearquitectura/web
                heroku container:release web -a tareadearquitectura
                heroku open -a tareadearquitectura
              '''
            }
       }

    }
}
