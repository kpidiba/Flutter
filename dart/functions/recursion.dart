void main() {
  var result = factorial(7);
  print(result);
}

int factorial(int x) {
  if (x == 1) {
    return 1;
  } else {
    return x * factorial(x - 1);
  }
}
