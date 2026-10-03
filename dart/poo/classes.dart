class Person {
  String? name;
  String? gender;
  int age = 0;

  Person() {}

  void eating() {
    print("$name is eating");
  }
  
  Person copy@ith(String? name,String? gender, int? age){
    return new Person(name: name ?? this.name,gender: gender ?? this.gender,age: age ?? this.age);
  }

}

void main(List<String> args) {
    Person david = Person();
    david.name = "hello";
    david.eating();
}
