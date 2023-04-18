void main() {
  var list1 = [1, 2, 34, 3, "man"];
  //NOTE: add element
  list1.add("hello world");
  list1.addAll(["man with", "mission"]);
  //NOTE: get index et remove
  var index = list1.indexOf("hello world");
  list1.removeAt(index);
  //NOTE:  remove all
  print(list1);
  //NOTE: modification on value
  var mapValue = list1.map((e) => e == "mission" ? e : "1");
  print(mapValue.toList());
  print(mapValue);
  //NOTE:set
  var a = {10, 30};
  //NOTE: declare with type
  var aT = <int>{12, 34};
  aT.remove(12);
  Set<int> empty = {};
  print("aT : $aT");
  print(a.runtimeType);
  var union = aT.union(a);
  print(union);
  //NOTE:difference ,Set contains only data elements, and
  //NOTE: the Map contains the data in the key-value pair, so Map contains key and its value
  //NOTE:map
  var capitals = {"TOGO": "LOme", "France": "Paris"};
  var number = Map<int, String>();
  //NOTE: checking key
  print(capitals.containsKey("TOGO"));
  var allKeys = capitals.keys;
  number[1] = "hello";
  number[2] = "world";
  print(number);
  print(allKeys);
}
