#!/usr/bin/env bash
##
## EPITECH PROJECT, 2021
## Untitled (Workspace)
## File description:
## test
##

test()
{
    cat tests/output/$ &> .expected
    ./ $1 &> .got
    diff -q .expected .got
    if [[ $? == 0 ]]
    then
        echo -e "\E[0;32m Test $9\E[0m \e[90m\e[1mPASSED\e\e[0m"
    else
        echo -e "\E[0;31m Test $9\e[0m \e[41mNOT PASSED\E[0m"
    fi
}

rm -f .expected
rm -f .got