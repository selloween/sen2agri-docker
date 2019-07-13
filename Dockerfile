FROM centos7:latest

RUN yum update \
    && yum install wget unzip

RUN mkdir /tmp/software
WORKDIR /tmp/software

## Copy MAJA V 3.2.2 TM
COPY ./Maja_3.2.2_TM.zip .

## Download installation package
#http://www.esa-sen2agri.org/operational-system/software-download/
RUN wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-package-2.0.1.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-gipp-maja-3.2.2.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/srtm.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/swbd.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-VisualizationTool-2.0.zip

RUN unzip ./*.zip


# TODO Xserver for Sen2Agri Configurator