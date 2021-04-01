FROM fedora:31

VOLUME /opt/robotframework/results
VOLUME /opt/robotframework/tests

RUN dnf upgrade -y && dnf install -y python37

RUN pip3 install \
robotframework \
robotframework-faker \
robotframework-requests==0.5.0 \
robotframework-seleniumlibrary \
robotframework-databaselibrary \
robotframework-sshlibrary==3.2.1
robotframework-databaselibrary robotframework-sshlibrary==3.2.1 | grep "Successfully installed"
