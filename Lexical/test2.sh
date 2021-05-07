#!/bin/sh
flex c-lex.l
gcc lex.yy.c -o lex_analyzer -lfl
./lex_analyzer test2.c
