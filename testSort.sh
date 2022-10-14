#!/bin/bash
rm selectionSort.csv
rm ~/www/Digital\ Portfolio/selectionSort.csv
echo -e "Sort Name,Date and Time,Test Number,Git Branch,Git Hash,Command Line Executed,Text File,Count of Strings,Type of File,Execution Time (real, to nearest ms)" > selectionSort.csv

cd testWords
for order in ordered.txt reverse-ordered.txt random.txt
do
    echo Trying $order... 
    for i in 0 1 2 3 4 5
    do
        let count=10**i
        echo testing $count numbers
        for j in 1 2 3 4 5
        do
            cat $order | head -n $count > temp.txt
            time=$( TIMEFORMAT=%R; { time cat temp.txt | ../selectionSort > /dev/null; } 2>&1)
            date=$(date +"%D %T")
            file="${order}10e${i}.txt" #fake file for requirement
            echo -e "selectionSort,${date},${j},main,bcb7f3980a593e749a343271914aac3a28eacaa5,time cat ${file} | ./selectionSort > /dev/null,${file},${count},${order},${time}" >> ../selectionSort.csv       
        done
    done
done
rm temp.txt
cp ../selectionSort.csv ~/www/Digital\ Portfolio/selectionSort.csv
chmod a+rx -R ~/www/Digital\ Portfolio
echo DONE - open selectionSort.csv, or go to your Digital Portfolio/selectionSort.csv to download the file       
echo Change the branch, hash, command, and file name to your liking.
