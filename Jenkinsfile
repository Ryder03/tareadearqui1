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
                git init
                heroku git:remote -a tareadearquitectura
                git add .
                git commit -am "make it better"
                git push heroku master
              '''
            }
       }

    }
}
