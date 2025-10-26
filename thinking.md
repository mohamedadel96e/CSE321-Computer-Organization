```cpp

int fibo (int n) {
    if (n <= 1) return n;
    return fibo(n - 1) + fibo(n - 2);
}
```


```cpp

int fibo (int n) {
    if (n <= 1) return n;

    int a = 0, b = 1;
    for (int i = 2; i <= n; i++)  {
        int temp = b;
        b = a + b;
        a = b
    }

    return b;
}
```
