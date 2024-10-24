# Basis-Image
FROM rocker/shiny:latest

# Installiere notwendige R-Pakete
RUN R -e "install.packages(c('shiny', 'ggplot2'), repos='http://cran.rstudio.com/')"

# Kopiere die Shiny-App in das Image
COPY ./test/app.R /srv/shiny-server/

# Setze den Arbeitsordner
WORKDIR /srv/shiny-server

# Exponiere den Port
EXPOSE 3838

# Starte den Shiny-Server
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app.R', host='0.0.0.0', port=3838)"]
