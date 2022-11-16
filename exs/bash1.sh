#!/bin/bash

FILENAME=LCP_22-23_students.csv

mkdir -p ~/students

if [ ! -f ~/students/${FILENAME} ]
then
    echo "the students file does not exist! I'm downloading it."
    wget -q https://www.dropbox.com/s/867rtx3az6e9gm8/LCP_22-23_students.csv
    mv LCP_22-23_students.csv ~/students/
else
    echo "The file already exists! I'm skipping the download."
fi

cd ~/students
echo "I'm creating two files with pod and physics students"
grep PoD $FILENAME > students_pod.csv
grep Physics $FILENAME > students_physics.csv
echo "Files created"

GRT=-1
NGRT=-1
for i in {A..Z} 
do
    TMP=$(cut -f1 -d "," $FILENAME | grep -c $i)
    if [$TMP -gt $NGRT ]
    then
        GRT = $i
        NGRT = $TMP
    fi
    echo "$i $TMP"
    # echo "$(echo $i) $(cut -f1 -d "," $FILENAME | grep -c $i)"
    # {echo $i && cut -f1 -d "," $FILENAME | grep -c $i;}
done



echo "The letter $GRT has the more occurence: $NGRT"

