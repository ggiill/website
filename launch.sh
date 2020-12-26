#!/bin/bash
hugo --cleanDestinationDir # build the site and places into /public
gsutil -m rsync -r -d public/ gs://www.gil.fyi # syncs to GCS
gsutil iam ch allUsers:objectViewer gs://www.gil.fyi # makes all GCS objctes public
# set no caching:
gsutil -m setmeta -r -h "Content-Type:text/html" \
  -h "Cache-Control:no-cache, max-age=0" \
  gs://www.gil.fyi/**.html
gsutil -m setmeta -r -h "Content-Type:text/css" \
  -h "Cache-Control:no-cache, max-age=0" \
  gs://www.gil.fyi/**.css
