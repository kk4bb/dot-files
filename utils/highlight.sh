#!/usr/bin/env bash

# this is to highlight whatever you specify but return the output as is, to be used with stuff like tcpdump where you're looking for a three-way hanshake for example

## I am using the second command line argument as this would usually be used after the pipe operator which would represent the first argument

grep -E "$2|$"
