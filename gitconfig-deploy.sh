#!/bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: ./gitconfig-deploy.sh <username> <email>"
else
  echo -e "[user]\n\tname=$1\n\temail=$2\n" > $HOME/.gitconfig
  cat .gitconfig >> $HOME/.gitconfig
fi

