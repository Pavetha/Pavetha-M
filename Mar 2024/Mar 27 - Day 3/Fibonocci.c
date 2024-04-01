#include <stdio.h>
int main()
{
    int n;
    scanf("%d",&n);
    int a=0,b=1,c=0;
    printf("%d ",a);
    printf("%d ",b);
    for(int i=3;i<=n;i++)
    {
        c=a+b;
        printf("%d ",c);
        a=b;
        b=c;
    }
    return 0;
}

/*output
7
0 1 1 2 3 5 8 */
