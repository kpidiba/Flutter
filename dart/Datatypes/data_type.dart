void main() {
  //Declaration des variables
  int first = 1;
  num second = 10.3;
  num second0 = 10e2;
  double third = 10000;
  String a = "a";
  String b = "b";
  const pi = 3.14;
  final time = DateTime.now();
  var bo = 12.3; //dynamic type
  print(first);
  print(first.runtimeType);
  print('second: $second');
  print('somme = ${second + third}');
  print(a + ' ' + b);
  print(second0);
  print(bo.runtimeType);
  print('la valeur de pi :$pi');
  print('la valeur du temps :$time');
}
