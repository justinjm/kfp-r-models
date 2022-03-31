FROM rstudio/plumber

# downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# install random forest
RUN R -e 'install.packages(c("randomForest"), repos = "https://cran.rstudio.com/")'

# Copy model and script
RUN mkdir /app
COPY serving.R /app
COPY startServer.R /app
COPY deploy.sh /app
WORKDIR /app

RUN chmod +x ./deploy.sh

# plumber & run server
EXPOSE 7080

ENTRYPOINT ["./deploy.sh"]