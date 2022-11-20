#include <stdio.h> 
#include "analizador/y.tab.h"
void parse(FILE *file);

int main(){
    FILE *file = fopen("entrada.txt", "r");
    parse(file);   
}