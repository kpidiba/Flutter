void main() {
  // List - order collection
  // items in specific order and can have duplicate
  
  // definition
  List<int> data = [1,2,3,4,6];
  var list1 = [1, 2, 34, 3, "man"];
  
  //NOTE: add element
  list1.add("hello world");
  list1.addAll(["man with", "mission"]);
  
  print("============== ALL ELEMENTS ========");
  print(list1);  
  print("====================================\n");


  //NOTE: get index et remove
  print("=============== REMOVE ELEMENT AT INDEX ===============");
  var index = list1.indexOf("hello world");
  list1.removeAt(index);
  print(list1);
  print("=======================================================\n");

  // SET COLLECTION - UNIQUE COLLECTION
  // SET DON'T ACCEPT DUPLICATE VALUE EVEN WHEN YOU PASS THEM TO HIM
  
  // declare Set Value
  Set<String> languages = {'Dart','Java','C#'};
  
  //NOTE:set
  var a = {10, 30};
  
  //NOTE: declare with type
  var aT = <int>{12, 34};

  print(a.first);
  print(a.last);
  print(a.contains(12));
  
//NOTE : MAP COLLECTION - KEY VALUE PAIRS
  // DON'T ACCEPT DUPLICATE
  // CONFIGURATION OR SETTINGS DATA , JSON LIKE DATA
  Map<String, int> ages = {
      'Jhon' : 40,
      'David' : 23,
      'Junior' : 25,
  };

  print(ages.keys);
  print(ages.values);

}
