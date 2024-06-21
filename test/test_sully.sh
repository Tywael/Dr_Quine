#!/bin/bash

language="c"
if [[ $1 = "ASM" || $1 = "s" ]]; then
    language="s"
fi

c_ret="5c5
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
s_ret=""

# Test Sully
cd ./exe
rm -f ./tmp_Sully
./Sully

echo  -n "Test Sully:     "
for i in {5..0}; do
    diff ./Sully_$i.$language ../Sully.$language >> ./tmp_Sully
done
if [[ $language = "s" ]]; then
    ret=$s_ret
else
    ret=$c_ret
fi
diff ./tmp_Sully <(echo "$ret")
if [ $? -eq 0 ]; then
    echo -e "\e[32mOK\e[0m"  # Green color for OK
else
    echo -e "\e[31mKO\e[0m"  # Red color for KO
fi