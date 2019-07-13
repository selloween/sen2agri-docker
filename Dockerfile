FROM centos/systemd

RUN yum update -y \
    && yum install -y epel-release \
    && yum --enablerepo=epel install -y p7zip unzip file expect

RUN useradd -m sen2agri-service \
    && usermod -aG sen2agri-service sen2agri-service \
    && useradd apache \
    && usermod -aG sen2agri-service apache

RUN mkdir -p /mnt/archives/srtm \
    && mkdir -p /mnt/archive/swbd \
    && mkdir /mnt/upload \
    && mkdir /mnt/archive/gipp_maja

VOLUME datasets/srtm /mnt/archive/srtm
VOLUME datasets/swbd /mnt/archive/swbd

RUN chown -R apache:sen2agri-service /mnt/upload
RUN chown -R sen2agri-service:sen2agri-service /mnt/archive

WORKDIR /home/sen2agri-service

COPY ./software .

RUN mv Sen2Agri-gipp-maja-3.2.2.zip /mnt/archive/gipp_maja \
    && 7za x /mnt/archive/gipp_maja/Sen2Agri-gipp-maja-3.2.2.zip

RUN 7za x Maja_3.2.2_TM.zip \
    && 7za x Sen2Agri-package-2.0.1.zip

WORKDIR /home/sen2agri-service/Maja-3.2.2-TM

RUN chmod +x MAJA-3.2.2_TM.run \
    && ./MAJA-3.2.2_TM.run

WORKDIR /home/sen2agri-service/Sen2AgriDistribution/install_script

ADD install.exp .

RUN chmod +x sen2agriPlatformInstallAndConfig.sh \
    && chmod +x install.exp \
    && ./install.exp

## TODO Cleanup

EXPOSE 80

CMD ["/usr/sbin/init"]