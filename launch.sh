#!/bin/bash
hugo # build the site and places into /public
gsutil -m rsync -R -d public/ gs://www.gil.fyi # syncs to GCS
gsutil iam ch allUsers:objectViewer gs://www.gil.fyi # makes all GCS objctes public
# set no caching:
gsutil setmeta -h "Content-Type:text/html" \
  -h "Cache-Control:private, max-age=0, no-transform" \
  gs://www.gil.fyi/*.html
