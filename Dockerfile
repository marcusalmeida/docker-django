FROM dockerfile/python

MAINTAINER "marcusalmeida"

# Install GIT and Build tools
RUN apt-get install -y build-essential git

RUN apt-get install -y vim 

# Adding ops' dir
ADD ./ops/ /home/docker/ops/

# Create a Virtual ENV
RUN cd /home/docker/ops/ && virtualenv --no-site-packages env

# Activate Virtual ENV
RUN /bin/bash -c "source /home/docker/ops/env/bin/activate"

# Run pip install requirements.
RUN pip install -r /home/docker/ops/requirements.txt

WORKDIR /opt/project/

# Create a new django project. You can change the project's name.
RUN django-admin.py startproject website 

CMD ["bash"]
