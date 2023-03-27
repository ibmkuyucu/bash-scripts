#!/bin/bash

case $1 in
    *[!0-9]*) echo "false" ;;
    *) echo "true" ;;
esac