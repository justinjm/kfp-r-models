#!/bin/bash

# copy the model to container
gsutil cp gs://garrido-ml-models/rmodel/model.RData .

# exec serving
R -f /app/startServer.R