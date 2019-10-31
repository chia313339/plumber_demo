#Start from the rocker/r-ver:3.6 image
FROM rocker/r-ver:3.6

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install plumber
RUN R -e "install.packages('plumber')"
RUN R -e "install.packages('xgboost')"

# copy everything from the current directory into the container
COPY / /

# open port 8500 to traffic
EXPOSE 8500

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "plumber.R"]
