#include <stdio.h>

int main() { 
   int a, b;
   int  prime= 1;
  scanf("%d",&b);

   for(a= 2 ; a < b ;  a++) {
      if((b % a) == 0) {
         prime = 0;
      }
   }

   if (prime == 1)
      printf("%d is prime number.", b);
   else
      printf("%d is not a prime number.", b);
   return 0;
}

/*output
41
41 is not a prime number.*/
