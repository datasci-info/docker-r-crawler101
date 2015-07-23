FROM c3h3/rstudio-java:latest

MAINTAINER Chia-Chi Chang <c3h3.tw@gmail.com>, Summit Suen <summit.suen@gmail.com>

RUN apt-get update && apt-get install libxml2-dev libzmq3-dev python-pip libcurl4-openssl-dev
RUN pip install "ipython[notebook]"
RUN mkdir /demo
ADD package_installer.R /demo/package_installer.R
RUN cd /demo && Rscript package_installer.R

ADD userconf.sh /usr/bin/userconf.sh
RUN chmod a+x /usr/bin/userconf.sh

ENV DEMOPATH /demo
