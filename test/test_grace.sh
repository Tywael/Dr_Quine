#!/bin/bash

# Test Colleen

language="c"
if [[ $1 = "ASM" || $1 = "s" ]]; then
    language="s"
fi

cd ./exe

echo  -n "Test Grace:     "
./Grace
diff ./Grace_kid.$language ../Grace.$language
if [ $? -eq 0 ]; then
    echo -e "\e[32mOK\e[0m"  # Green color for OK
else
    echo -e "\e[31mKO\e[0m"  # Red color for KO
fi
