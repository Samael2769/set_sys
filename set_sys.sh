#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Wrong arg number"
else
    M=$1;
    echo -e "\e[0;32mProcessing Environment for project [$1]\n\e[0m"
    echo -e "\e[0;31mMaking Directories...\e[0m"
    mkdir sources/
    mkdir tests/
    mkdir includes/
    mkdir .github/
    mkdir .github/workflows/

    echo -e "\e[0;31mMaking Makefile...\e[0m"
    cp /home/$USER/Makefile ./
    sed -i -e 32i"NAME\t=\t$1" Makefile

    echo -e "\e[0;31mMaking Includes...\e[0m"
    cp /home/$USER/include.h includes/$1.h
    echo -ne "\n#ifndef ${M^^}_H\n#define ${M^^}_H\n#endif /* !${M^^}_H */" >> includes/$1.h

    echo -e "\e[0;31mMaking main...\e[0m"
    cp /home/$USER/main.c ./sources/main.c
    sed -i 7i"#include \"$1.h\"" sources/main.c

    echo -e "\e[0;31mMaking bash test and github actions...\n\e[0m"
    cp /home/$USER/test.sh tests/test_$1.sh
    chmod 777 tests/test_$1.sh
    cp /home/$USER/install_criterion.sh tests/
    cp /home/$USER/test_env.yml .github/workflows/test_$1.yml
    sed -i 1i"name: test_$1" .github/workflows/test_$1.yml
    sed -i -e 19i"/\t\t\trun: tests/test_$1.sh" .github/workflows/test_$1.yml
    cp /home/$USER/test_test.c tests/test_$1.c
    sed -i 10i"#include \"$1.h\"" tests/test_$1.c

    echo -e "\e[0;32mEnvironment done !\e[0m"
fi