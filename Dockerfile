FROM rocker/geospatial

RUN Rscript -e "install.packages('rayshader', repos='http://cran.rstudio.com/')"
