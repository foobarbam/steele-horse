#!/bin/bash -e

# Script to build this website
ROOT_DIR="$(cd $(dirname $0)/.. && pwd)"

# Build Hugo Site
cd $ROOT_DIR/hugo
rm -rf public/
hugo