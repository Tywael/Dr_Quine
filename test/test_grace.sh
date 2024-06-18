#!/bin/bash

# Test Colleen
echo  -n "Test Grace:     "
./Grace
diff Grace_kid.c ./c/Grace.c
if [ $? -eq 0 ]; then
    echo -e "\e[32mOK\e[0m"  # Green color for OK
else
    echo -e "\e[31mKO\e[0m"  # Red color for KO
fi
