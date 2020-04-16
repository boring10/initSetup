#!/bin/bash

# Global npm packages
npmModules=()
npmModules+=('nodemon')
npmModules+=('clasp')
npmModules+=('instant-markdown-d')
npmModules+=('jsdoc')
npmModules+=('webpack')
npmModules+=('webpack-dev-server')

allModules=''
for module in "${npmModules[@]}"
do
  allModules+="$module "
done

sudo npm install -g $allModules --silent

