FROM rstudio/plumber

# install random forest
RUN R -e 'install.packages(c("randomForest"), repos = "https://cran.rstudio.com/")'

# Copy model and script
RUN mkdir /app
COPY job.R /app
WORKDIR /app

ENTRYPOINT ["R", "-f", "job.R"]
