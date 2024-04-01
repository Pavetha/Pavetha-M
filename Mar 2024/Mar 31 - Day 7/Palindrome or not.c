int main()
{
    int n,rev=0,p,q;
    scanf("%d",&n);
    q=n;
    while(n>0)
    {
        p=n%10;
        rev=(rev*10)+p;
        n=n/10;
    }
    if(q==rev)
    {
        printf("It is Palindrome");
    }
    else
    {
        printf("It is Not palindrome");
    }
    return 0;
}

/* output
88
It is Palindrome
*/
