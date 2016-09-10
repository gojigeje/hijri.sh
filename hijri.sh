#!/bin/bash
# ----------------------------------------------------------------------------------
# @name    : hijri.sh
# @version : 0.2
# @date    : 10/09/16 08:36:54
#
# ABOUT
# ----------------------------------------------------------------------------------
# Simple bash script to display Islamic date (Hijri / Hijriyah).
# Ported from php script I found on internet. I do not own the calculation method.
#
# LICENSE
# ----------------------------------------------------------------------------------
#  The MIT License (MIT)
#  Copyright (c) 2016 Ghozy Arif Fajri <gojigeje@gmail.com>

# date adjustment, use positive number to add days, negative number to substract, '0' for none.
adjust=1

date=$(date +%d -d "$adjust day" | sed 's/^0*//')
month=$(date +%m | sed 's/^0*//')
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
