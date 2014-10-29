FROM dockerfile/python

MAINTAINER "marcusalmeida"

# Install GIT and Build tools
RUN apt-get install -y build-essential git

# Adding ops' dir
ADD ./ops/ /home/docker/ops/

# Setting project's dir
WORKDIR /opt/project

# Create a Virtual ENV
RUN virtualenv --no-site-packages env

# Activate Virtual ENV
RUN /bin/bash -c "source /opt/project/env/bin/activate"

# Run pip install requirements.
RUN pip install -r /home/docker/ops/requirements.txt

# Create a new django project. You can change the project's name.
RUN django-admin.py startproject website 

CMD ["bash"]
