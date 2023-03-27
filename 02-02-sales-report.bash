#!/bin/bash

divider=====================================
divider=$divider$divider

header="\n %-10s %11s %8s %10s\n"
format=" %-10s %11.2f %8d %10.2f\n"

totalwidth=44

printf "$header" ITEM "PER UNIT" NUM TOTAL

printf "%$totalwidth.${totalwidth}s\n" "$divider"

printf "$format" Chair 79.95 4 319.8 Table 209.99 1 209.99 Armchair 315.49 2 630.98