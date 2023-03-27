#!/bin/bash

secs_in_day=86400
secs_in_hour=3600
mins_in_hour=60
secs_in_min=60

days=$(( $1 / $secs_in_day ))
secs=$(( $1 % $secs_in_day ))
hours=$(( $secs / $secs_in_hour ))
secs=$(( $secs % $secs_in_hour ))
mins=$(( $secs / $secs_in_min ))
secs=$(( $secs % $secs_in_min ))

printf "%d:%02d:%02d:%02d\n" "$days" "$hours" "$mins" "$secs"