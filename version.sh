#!/bin/bash

# Author: Ariel Simhon
# Purpose: Manage version

# Get current version
aws s3 cp s3://engineering-days/version version

# Determine next version
oldVersion=$(cat version)
Version=$(perl -E "say $oldVersion+0.1")

# Update version
echo $Version > version
aws s3 cp version s3://engineering-days/version

sed -i "s/VERSION/$Version/g" k8s/deploy*.yml
