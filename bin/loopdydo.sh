#!/bin/bash

#
shopt -s nullglob
for f in _*
do
    newname=`echo $f | sed 's/^_//'`
    #-n dry run, -v verbose
    git mv "$f" "$newname"
done
