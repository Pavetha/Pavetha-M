int main()
{
    int a,b;
    int r=1,s;
    scanf("%d %d",&a,&b);
    s=b;
    while(b>0)
    {
        r=r*b;
        b--;
    }
    printf("%d power %d is:%d",a,s,r);
    return 0;
}

/* output:
3
2
3 power 2 is:9   */
