void main13() {
    static int i = 1;
    static int product = 0;
    while (i < 5) {
        product = product * i;
        ++i;
    }
}