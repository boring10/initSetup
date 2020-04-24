#!/bin/bash

# Global npm packages
npmModules=()
npmModules+=('clasp')
npmModules+=('instant-markdown-d')
npmModules+=('jsdoc')
npmModules+=('neovim')
npmModules+=('nodemon')
npmModules+=('webpack')
npmModules+=('webpack-dev-server')

allModules=''
for module in "${npmModules[@]}"
do
  allModules+="$module "
done

sudo npm install -g $allModules --silent

