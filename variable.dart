void main() {
  // Statically typed variables
  int age = 25;
  double height = 5.9;
  String name = "Alice";
  bool isStudent = true;

  // Type inference using var
  var city = "New York";

  // Dynamic variable
  dynamic data = 100;
  data = "Changed to String";

  // Constant variables
  const pi = 3.14159;
  final country = "India";

  // Printing all variables
  print("Name: $name");
  print("Age: $age");
  print("Height: $height");
  print("Is Student: $isStudent");
  print("City: $city");
  print("Dynamic Data: $data");
  print("Country: $country, PI: $pi");
}
