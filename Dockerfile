FROM debian:latest
MAINTAINER Patricio Gonzalez

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nano
RUN apt-get -y install net-tools
RUN apt-get -y install git
RUN apt-get -y install python-pip
RUN apt-get -y install virtualenv
RUN apt-get -y install curl
RUN pip install gunicorn
RUN curl https://cli-assets.heroku.com/install.sh | sh
RUN pip install django-heroku
RUN mkdir Tarea1
RUN cd Tarea1/ && git clone https://github.com/gnarula/django-ribbit.git && virtualenv --no-site-packages ribbit_env
RUN bash -c "source Tarea1/ribbit_env/bin/activate" 
RUN pip install Django==1.6 South 
RUN cd Tarea1/django-ribbit/ && python manage.py syncdb --noinput
RUN cd Tarea1/django-ribbit/ && python manage.py migrate ribbit_app
RUN touch Tarea1/django-ribbit/Procfile && echo "web: gunicorn django-ribbit.wsgi --log-file -"


EXPOSE 8000
CMD python Tarea1/django-ribbit/manage.py runserver 0.0.0.0:8000
