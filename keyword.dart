// Import keyword example
import 'dart:math';

// Class and object example
class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void display() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  // Variables
  var student1 = Student("Bob", 20);
  final maxScore = 100;
  int totalScore = 0;

  // Loop keyword (for)
  for (int i = 1; i <= 5; i++) {
    totalScore += i;
    if (totalScore > 10) {
      print("Total score exceeded 10, breaking the loop");
      break; // break keyword
    }
    continue; // continue keyword
  }

  // Conditional keyword (if-else)
  if (totalScore > 10) {
    print("High score: $totalScore");
  } else {
    print("Score is $totalScore");
  }

  // Using object and method
  student1.display();

  // Using return in a function
  print("Random number: ${generateRandom()}");
}

// Function with return keyword
int generateRandom() {
  return Random().nextInt(100);
}
