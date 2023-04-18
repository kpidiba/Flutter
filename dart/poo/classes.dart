class Person {
  String? name;
  String? gender;
  int age = 0;

  Person() {}

  void eating() {
    print("$name is eating");
  }

}

void main(List<String> args) {
    Person david = Person();
    david.name = "hello";
    david.eating();
}
