//Abstraction + Interface
abstract class Product {
  void displayInfo(); // abstract method
}

class Discountable {
  double getDiscount() => 0.10; // interface style
}

//Class + Encapsulation + Getters/Setters +inheritancce 
class Items extends Product implements Discountable {
  String _name;
  double _price;

  //Parameterized constructor
  Items(this._name, this._price);

  //Getters
  String get name => _name;
  double get price => _price;

  //Setter
  set price(double p) {
    if (p > 0) _price = p;
  }

  //Abstraction method override
  @override
  void displayInfo() {
    print("Item : $_name | Price : ₹$_price");
  }

  @override
  double getDiscount() => 0.20;
}

//Inheritance + Polymorphism
class Electronics extends Items {
  int warranty;

  Electronics(String name, double price, this.warranty)
      : super(name, price);

  @override
  void displayInfo() {
    print("Electronics : $name | Price : ₹$price | Warranty : $warranty years");
  }
}

class Clothing extends Items {
  String size;

  Clothing(String name, double price, this.size)
      : super(name, price);

  @override
  void displayInfo() {
    print("Clothing : $name | Price : ₹$price | Size : $size");
  }
}

//Singleton + Factory Constructor
class Cart {
  static Cart? _instance;
  List<Items> items = [];

  //Factory constructor
  factory Cart() {
    _instance ??= Cart._internal();
    return _instance!;
  }

  Cart._internal();

  void addItems(Items item) {
    items.add(item);
    print("${item.name} added to cart");
  }

  void viewCart() {
    print("\n----- CART ITEMS -----");
    for (var item in items) {
      item.displayInfo();
    }
  }
}

//Composition Example
class User {
  String name;
  Cart cart;

  User(this.name) : cart = Cart(); // composition
}

//Main Program (All OOP Concepts)
void main() {
  User user = User("Ajay");

  //Create objects
  Electronics laptop = Electronics("Laptop", 60000, 2);
  Clothing tshirt = Clothing("T-Shirt", 500, "M");

  //Polymorphism calls
  laptop.displayInfo();
  tshirt.displayInfo();

  //Add to cart
  user.cart.addItems(laptop);
  user.cart.addItems(tshirt);

  //View cart
  user.cart.viewCart();

  //Discount example
  print("\nDiscount on laptop : ${laptop.getDiscount() * 100}%");
}
