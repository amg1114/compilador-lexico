rm -rf ./*.c
rm -rf ./*.h

lex lexer.l
yacc parser.y -d
#gcc ../main.c *.c