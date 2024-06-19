#!/bin/bash

# Test Colleen
cd ./c/exe
echo  -n "Test Colleen:     "
./Colleen > ./tmp_Colleen
diff ./tmp_Colleen ../Colleen.c
if [ $? -eq 0 ]; then
    echo -e "\e[32mOK\e[0m"  # Green color for OK
else
    echo -e "\e[31mKO\e[0m"  # Red color for KO
fi
rm ./tmp_Colleen
