#!/bin/bash

# stop execution of script when first exception will happen, $?>0
set -e
ls ~/notexistingfolder
echo "after list of not existing folder"
