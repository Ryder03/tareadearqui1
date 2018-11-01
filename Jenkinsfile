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
                sh '''
                    docker build -t tarea .
                '''
            }
        }

       stage ('Deploy') {
            steps {
              sh '''
                heroku login
                docker login
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
