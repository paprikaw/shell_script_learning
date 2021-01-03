#!/bin/sh

echo ">>>>>>>> Add changes"
git add .
echo ">>>>>>>> Commit"
git commit -m $1
git status
