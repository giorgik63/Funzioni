/* File: main.c
 * Author: Giorgio Guglielmone  Date: 20/04/2021 - 14:26:00
 *
 * Description: Test progetto con 2 sorgenti .c e Makefile creato
 *              appositamente.
 *
 * History:
 *
*/

#include <stdio.h>
#include "esempio.h" // Inclusione del file header

int main(int argc, char *argv[]) {
    (void) argc;
    (void) argv;

    int fattoriale = 0, num = 4;
    int primoNumero = 0, secondoNumero = 0;
    long prodotto = 0;
    int result;
    
    printf("Inserisci il primo numero: ");
    scanf("%d", &primoNumero);
    printf("Inserisci ora il secondo numero: ");
    scanf("%d", &secondoNumero);

    // Chiamata la funzione per calcolare il massimo numero
    result = massimo(primoNumero, secondoNumero);
    printf("\nIl numero maggiore tra i due inseriti, ovvero %d e %d, e' il numero %d", primoNumero, secondoNumero, result);
    
    // Chiamata di funzione per calcolare il fattoriale
    fattoriale = fact(num);
    printf("\n\nIl fattoriale del numero %d e' %d\n", num, fattoriale);
    
    // Chiamata funzione nuova
    prodotto = prod(primoNumero, secondoNumero);
    printf("\nIl prodotto di %d * %d = %ld\n", primoNumero, secondoNumero, prodotto);

    printf("Fine programma calcola\n");

    return 0;
}
