void main() {
  Person p = new Person();
}

class Person {
  String _name = "";
  int _age = 0;
  String get name => this._name;

  set name(String value) => this._name = value;

  get age => this._age;

  set age(value) => this._age = value;

  Person({String name="", int age=0}) {
    this.age = age;
    this.name = name;
  }
}
