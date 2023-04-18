void main() {
  var operator = 2;
  var operator1 = 3;

  print(operator / operator1);   print(operator ~/ operator1);

  //NOTE: type test operator
  double typ1 = 10.01;
  int type2 = 6;
  print(typ1 is bool);
  print(type2 is double);
}
