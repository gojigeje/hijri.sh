#!/bin/bash
# ----------------------------------------------------------------------------------
# @name    : hijri.sh
# @version : 0.1
# @date    : 01/15/2014 08:25:46 AM
#
# ABOUT
# ----------------------------------------------------------------------------------
# Simple bash script to display Islamic date (Hijri / Hijriyah).
# Ported from php script I found on internet. I do not own the calculation method.
#
# LICENSE
# ----------------------------------------------------------------------------------
#  The MIT License (MIT)
#  Copyright (c) 2013 Ghozy Arif Fajri <gojigeje@gmail.com>

date=$(date +%d | sed 's/^0*//')
month=$(date +%m)
year=$(date +%Y)

array_bulan=( "Muharram" "Safar" "Rabiul Awwal" "Rabiul Akhir" "Jumadil Awwal" "Jumadil Akhir" "Rajab" "Sya’ban" "Ramadhan" "Syawwal" "Zulqaidah" "Zulhijjah" )

a=$(( $(( $month-14)) / 12 ))
b=$(( $(( $year+4900+$a )) / 100 ))
c=$(( $(( 1461 * $(( $year+4800+$a )) )) / 4 ))
d=$(( $(( 367 * $(( $month-2-12*$a )) )) / 12 ))
e=$(( $(( 3*$b )) / 4 ))
jd=$(( $c + $d - $e + $date - 32075 ))
wd=$(( $jd % 7 ))
l=$(( $jd - 1948440 + 10632 ))
n=$(( $(( $l - 1 )) / 10631 ))
l=$(( $l - 10631 * $n + 354 ))
z=$(( $(( $(( 10985 - $l )) / 5316 )) * $(( $(( 50 * $l )) / 17719 )) + $(( $l / 5670 )) * $(( $(( 43 * $l )) / 15238 )) ))
l=$(( $l - $(( $(( 30 - $z )) / 15 )) * $(( $(( 17719 * $z )) / 50 )) - $(( $z / 16 )) * $(( $(( 15238 * $z )) / 43 )) + 29 ))
m=$(( $(( 24 * $l )) / 709 ))
d=$(( $l - $(( $(( 709 * $m )) / 24 )) ))
y=$(( 30 * $n + $z - 30 ))

tanggal=$d
bulan=${array_bulan[$m-1]}
tahun=$y

echo "$tanggal $bulan $tahun H"
