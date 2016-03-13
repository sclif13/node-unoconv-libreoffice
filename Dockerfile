FROM ubuntu:latest
MAINTAINER Alexandr Opryshko "sclif13@gmail.com" 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \ 
&& apt-get install -y software-properties-common python-software-properties \
&& add-apt-repository -y ppa:libreoffice/ppa && apt-get update \
&& apt-get -y -q install libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-7-jre fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa \
&& apt-get -q -y remove libreoffice-gnome \
&& apt-get -q -y install unoconv fonts-crosextra-carlito fonts-crosextra-caladea ttf-liberation curl\
&& curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - \
&& apt-get install -y nodejs \
&& apt-get -y clean

