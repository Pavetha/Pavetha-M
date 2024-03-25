swapping of number

#include <stdio.h>

int main() {
    int a,b;
    scanf("%d %d",&a,&b);
    printf("Before swapping a=%d and b=%d",a,b);
    int temp;
    temp=a;
    a=b;
    b=temp;
    printf("\nAfter swapping a=%d and b=%d",a,b);

    return 0;
}

output
4
5
Before swapping a=4 and b=5
After swapping a=5 and b=4
