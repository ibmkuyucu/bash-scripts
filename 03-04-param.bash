#!/bin/bash

case $1 in
    *"$2"*) echo "true" ;;
    *) echo "false" ;;
esac