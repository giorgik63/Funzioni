/* File: esempio.c
 * Author: Giorgio Guglielmone  Date: 20/04/2021 - 14:31:00
 *
 * Description: libreria funzioni usate nel main.c
 *
 * History:
 *
*/

#include <stdio.h>
#include "esempio.h"

// Calcolare il massimo
int massimo(int x1, int x2) {
    if (x1 > x2)
        return x1;
    else
        return x2;
}

// Calcolare il fattoriale (iterativo)
int fact(int n) {
    int i = 1, temp = 1;
    
    while (i <= n){
        temp = temp * i;
        i++;
    }
    return temp;
}

// Nuova funzione
long prod(int x1, int x2) {
	long risultato = x1 * x2;
	return risultato;
}
