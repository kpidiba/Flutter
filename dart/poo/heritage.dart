void main() {
  Car c = new Car("a", 2, 3);
  c.printDetails();
}

class Vehicul {
  String _brand;
  num _capacity;
  String get brand => this._brand;

  set brand(String value) => this._brand = value;

  get capacity => this._capacity;

  set capacity(value) => this._capacity = value;

  Vehicul(this._brand, this._capacity);

  void printDetails() {
    print("Brand $brand");
    print("capacity $capacity");
  }
}

class Car extends Vehicul {
  num _numb = 1;

  Car(String brand, num capacity, this._numb) : super(brand, capacity);

  @override
  void printDetails() {
    // TODO: implement printDetails
    print("numb : $_numb");
  }
}
