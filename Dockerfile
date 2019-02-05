FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get install -y apache2 php5.6 php5.6-sybase php5.6-odbc tdsodbc unixodbc freetds-dev php5.6-sybase php5.6-xml
RUN apt-get -y autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN a2enmod rewrite

#RUN /usr/sbin/a2enmod rewrite
#RUN php5enmod mssql

# Edita apache2.conf o php.ini para cambiar las config // php5.6-mbstring php5.6-mcrypt php5.6-xml php5.6-mssql
ADD apache2.conf /etc/apache2/
ADD php.ini /etc/php5/apache2/

# Edita 000-default.conf para cambiar las config del sitio
ADD 000-default.conf /etc/apache2/sites-available/

# Descomenta estas lineas en el Archivo Docker para reparar errores con el UT8 de texto o tiempo:
ADD freetds.conf /etc/freetds/
# ADD locales.conf /etc/freetds/

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
