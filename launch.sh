#!/bin/bash
echo "**BUILDING SITE**"
hugo --cleanDestinationDir # build the site and places into /public
echo "**DEPLOYING ON FIREBASE**"
firebase login --reauth
firebase deploy
echo "**DONE**"
