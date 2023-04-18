printOne(int age, {String? name, String? username}) {
  print("age: $age ,name: $name ,username: $username");
}

printTwo(int age, [String? name, String? username]) {
  print("age: $age ,name: $name ,username: $username");
}

void main() {
  printOne(12,name:"hello",username: "world");
  printTwo(12);
}
