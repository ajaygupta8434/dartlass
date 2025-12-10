class Animal {}
class Dog extends Animal {
  void bark() {
    print("Woof!");
  }
}


void main(){
  //number to string coversion 
  int num = 42;
   String str = num.toString();
   print(str);
   double dbl =99.99;
   String priceStr = dbl.toString();
   print(priceStr);
   //String to number
   String str1 ="123";
   int roll =int.parse(str1);
   print(roll);
   String price1 ="99.99";
   double dbl1= double.parse(price1);
   print(dbl1);


//type casting using As
Animal animal = Dog();
  (animal as Dog).bark(); // Woof!
}