FROM gcr.io/cloudshell-images/cloudshell:latest
ARG BUILDDIR="/tmp/build"
ARG PYTHON_VER="3.6.8"
WORKDIR ${BUILDDIR}

RUN apt-get update -qq && \
apt-get upgrade -y  > /dev/null 2>&1 && \
apt-get install wget gcc make zlib1g-dev -y -qq > /dev/null 2>&1 && \
wget --quiet https://www.python.org/ftp/python/${PYTHON_VER}/Python-${PYTHON_VER}.tgz > /dev/null 2>&1 && \
tar zxf Python-${PYTHON_VER}.tgz && \
cd Python-${PYTHON_VER} && \
./configure  > /dev/null 2>&1 && \
make > /dev/null 2>&1 && \
make install > /dev/null 2>&1 && \
rm -rf ${BUILDDIR} 

RUN curl -LO https://git.io/get_helm.sh && \
chmod +x get_helm.sh && \ 
./get_helm.sh 

RUN wget https://github.com/gojek/feast/releases/download/v0.1.1/feast-cli-v0.1.1-linux-amd64 && \
chmod +x feast-cli-v0.1.1-linux-amd64 && \
mv feast-cli-v0.1.1-linux-amd64 /usr/local/bin/feast

# Add your content here

# To trigger a rebuild of your Cloud Shell image:
# 1. Commit your changes locally: git commit -a
# 2. Push your changes upstream: git push origin master

# This triggers a rebuild of your image hosted at gcr.io/test101-242205/custom_env.
# You can find the Cloud Source Repository hosting this file at https://source.developers.google.com/p/test101-242205/r/custom_env
