FROM centos7:latest

RUN yum update \
    && yum install wget unzip 

#http://www.esa-sen2agri.org/operational-system/software-download/
RUN wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-package-2.0.1.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-gipp-maja-3.2.2.zip \
    #&& wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-gipp-maccs.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/srtm.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/swbd.zip \
    && wget http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-VisualizationTool-2.0.zip

## Downlad MACCS 5.1.5 and MAJA V 3.2.2 TM
# MACCS
# RUN wget https://logiciels.cnes.fr/en/license/60/362 \
# MAJA
RUN wget https://logiciels.cnes.fr/en/license/58/421


# TODO Xserver for Sen2Agri Configurator