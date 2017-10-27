#!/bin/bash
#mevcut dizinleri alfabetik altdizinlere atar
for dir in */ ; do
    start=${dir:0:1}
    mkdir -p ${start}
    # büyük harf için
    #mkdir -p ${start^^}
    mv "$dir" ${start}
    # büyük harf için
    #mv "$dir" ${start^^}
done
