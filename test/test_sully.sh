#!/bin/bash

ret="5c5
< int i = 4;
---
> int i = 5;
5c5
< int i = 3;
---
> int i = 5;
5c5
< int i = 2;
---
> int i = 5;
5c5
< int i = 1;
---
> int i = 5;
5c5
< int i = 0;
---
> int i = 5;"

# Test Sully
cd ./c/exe
rm -f ./tmp_Sully
./Sully

echo  -n "Test Sully:     "
for i in {5..0}; do
    diff ./Sully_$i.c ../Sully.c >> ./tmp_Sully
done
diff ./tmp_Sully <(echo "$ret")
if [ $? -eq 0 ]; then
    echo -e "\e[32mOK\e[0m"  # Green color for OK
else
    echo -e "\e[31mKO\e[0m"  # Red color for KO
fi