#!/bin/sh
cd $(dirname "$0")
mv cf cf-prev
/usr/bin/curl http://cfdownloads.ldschurch.org/cli/build/lds-cf-darwin-amd64.tgz | tar x