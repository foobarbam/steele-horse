#!/bin/bash -e

# Script to deploy this website
ROOT_DIR="$(cd $(dirname $0)/.. && pwd)"

cd $ROOT_DIR/hugo
hugo serve