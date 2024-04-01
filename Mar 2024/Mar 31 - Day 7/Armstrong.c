int main() {
    int n, a, remainder, r = 0;
    scanf("%d", &n);
    a= n;
    while (a!= 0) {
        remainder = a % 10;
        r += remainder * remainder * remainder;
        a /= 10;
    }
    if (r == n)
        printf("%d is an Armstrong number.", n);
    else
        printf("%d is not an Armstrong number.", n);
    return 0;
}

/*output
Enter an integer: 1634
1634 is an Armstrong number. */
