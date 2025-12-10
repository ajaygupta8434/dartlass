import 'dart:io';
void main(){
  print("Enter your name:-");
  String? name =stdin.readLineSync();
  print("enter your age:-");
  int? age = int.parse(stdin.readLineSync()!);
  print("name $name , age $age");
}