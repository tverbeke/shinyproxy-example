FROM rocker/shiny

MAINTAINER Sergio Fernández "acsdesk@protonmail.com"

RUN apt-get update && apt-get upgrade -y 

RUN R -e "install.packages('shinyjs')"

RUN rm -rf /srv/shiny-server/*
COPY . /srv/shiny-server/

EXPOSE 3838
CMD ["/usr/bin/shiny-server.sh"]
