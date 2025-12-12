// // import 'dart:io';

// // // Custom Exception
// // class InvalidPhone implements Exception {
// //   String message;
// //   InvalidPhone(this.message);
// //   String toString() => "InvalidPhoneNumber: $message";
// // }

// // // Function to validate phone number
// // void validatePhoneNumber(String number) {
// //   if(number.length != 10) {
// //     throw InvalidPhone("Phone number must be 10 digits.");
// //   } else if(!RegExp(r'^[0-9]+$').hasMatch(number)) {
// //     throw InvalidPhone("Phone number must contain only digits.");
// //   } else {
// //     print("Phone number is valid: $number");
// //   }
// // }

// // void main() {
// //   while(true) {
// //     stdout.write("Enter a phone number (or type 'exit' to quit): ");
// //     String input = stdin.readLineSync()!;

// //     if(input.toLowerCase() == 'exit') {
// //       print("Program terminated.");
// //       break;
// //     }

// //     try {
// //       validatePhoneNumber(input);
// //     } on InvalidPhone catch(e) {
// //       print(e);
// //     } catch(e, s) {
// //       print("Unexpected error: $e");
// //       print("Stack trace: $s");
// //     } finally {
// //       print("Validation attempt completed.\n");
// //     }
// //   }
// // }



// import 'dart:io';

// // Custom Exception for Invalid Marks
// class InvalidMarksException implements Exception {
//   String message;
//   InvalidMarksException(this.message);
//   String toString() => "InvalidMarksException: $message";
// }

// // Function to calculate grade
// String calculateGrade(int marks) {
//   if(marks < 0 || marks > 100) {
//     throw InvalidMarksException("Marks must be between 0 and 100.");
//   } else if(marks >= 90) {
//     return "A";
//   } else if(marks >= 75) {
//     return "B";
//   } else if(marks >= 50) {
//     return "C";
//   } else {
//     return "Fail";
//   }
// }

// void main() {
//   while(true) {
//     stdout.write("Enter student name (or type 'exit' to quit): ");
//     String name = stdin.readLineSync()!;
//     if(name.toLowerCase() == 'exit') break;

//     stdout.write("Enter marks for $name: ");
//     String input = stdin.readLineSync()!;

//     try {
//       int marks = int.parse(input); // may throw FormatException
//       String grade = calculateGrade(marks);
//       print("$name's Grade: $grade");
//     } on FormatException {
//       print("Please enter a valid number for marks.");
//     } on InvalidMarksException catch(e) {
//       print(e);
//     } catch(e, s) {
//       print("Unexpected error: $e");
//       print("Stack trace: $s");
//     } finally {
//       print("Grade calculation attempt completed.\n");
//     }
//   }

//   print("Program terminated.");
// }
