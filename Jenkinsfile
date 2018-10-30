pipeline {
    agent any

       stage('Clone sources') {
          git 'https://github.com/Ryder03/tareadearqui1.git'
       }

        stage ('Build') {
            steps {
                echo 'Building..'
            }
        }

       stage('Deploy'){

         echo 'deploy'

         sh 'heroku container:login'
         sh 'docker build -t registry.heroku.com/vamosquesepuede/web .'
         sh 'docker push registry.heroku.com/vamosquesepuede/web'
         sh 'heroku container:release web -a vamosquesepuede'
         sh 'heroku open -a vamosquesepuede'

       }
}
