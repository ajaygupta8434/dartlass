
// ---------------------------
// 1) Abstract "Person" class
//    - Provides common property 'name' and an abstract showDetails()
// ---------------------------
abstract class Person {
  String _name; // private field (encapsulation)

  Person(this._name); // parameterized constructor

  // getter and setter for name
  String get name => _name;
  set name(String value) {
    if (value.trim().isNotEmpty) _name = value;
  }

  // Abstract method — subclasses must implement
  void showDetails();
}

// ---------------------------
// 2) "Gradable" interface-like abstraction
//    - Any class that can be graded should implement this
// ---------------------------
abstract class Gradable {
  // returns a grade string like "A", "B+", etc.
  String calculateGrade();
}

// ---------------------------
// 3) Student class: extends Person, implements Gradable
//    - Encapsulated fields: _roll, _marks
//    - Implements calculateGrade() and showDetails()
// ---------------------------
class Student extends Person implements Gradable {
  int _roll;
  List<int> _marks; // list of marks for subjects

  // Parameterized constructor
  Student(String name, this._roll, List<int> marks) : _marks = List.from(marks), super(name);

  // Getters and setters
  int get roll => _roll;
  set roll(int r) {
    if (r > 0) _roll = r;
  }

  List<int> get marks => List.unmodifiable(_marks); // read-only from outside

  void setMarks(List<int> newMarks) {
    // validate: marks between 0 and 100
    if (newMarks.every((m) => m >= 0 && m <= 100)) {
      _marks = List.from(newMarks);
    }
  }

  // Convenience: average of marks
  double get average {
    if (_marks.isEmpty) return 0.0;
    return _marks.reduce((a, b) => a + b) / _marks.length;
  }

  // Implementation of Gradable
  @override
  String calculateGrade() {
    double avg = average;
    if (avg >= 90) return 'A+';
    if (avg >= 80) return 'A';
    if (avg >= 70) return 'B+';
    if (avg >= 60) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  // Implementation of abstract showDetails
  @override
  void showDetails() {
    print('--- Student Details ---');
    print('Name : $name');
    print('Roll : $_roll');
    print('Marks: ${_marks.join(", ")}');
    print('Average: ${average.toStringAsFixed(2)}');
    print('Grade  : ${calculateGrade()}');
  }
}

// ---------------------------
// 4) StudentManager (Singleton using factory)
//    - Manages a collection of Student objects
//    - Demonstrates composition (has-a List<Student>)
// ---------------------------
class StudentManager {
  static StudentManager? _instance; // singleton instance
  final List<Student> _students = [];

  // Factory constructor for singleton behavior
  factory StudentManager() {
    _instance ??= StudentManager._internal();
    return _instance!;
  }

  // Private internal constructor
  StudentManager._internal();

  // Add a student (if roll unique)
  bool addStudent(Student s) {
    if (_students.any((st) => st.roll == s.roll)) {
      // roll number already exists
      return false;
    }
    _students.add(s);
    return true;
  }

  // Remove by roll
  bool removeStudentByRoll(int roll) {
    return _students.removeWhere((s) => s.roll == roll) > 0;
  }

  // Find by roll
  Student? findByRoll(int roll) {
    return _students.firstWhere((s) => s.roll == roll, orElse: () => null);
  }

  // Show all students
  void showAllStudents() {
    if (_students.isEmpty) {
      print('No students in system.');
      return;
    }
    for (var s in _students) {
      s.showDetails();
      print(''); // blank line between students
    }
  }

  // Update marks for a student
  bool updateMarks(int roll, List<int> newMarks) {
    var s = findByRoll(roll);
    if (s == null) return false;
    s.setMarks(newMarks);
    return true;
  }

  // Count
  int get count => _students.length;
}

// ---------------------------
// 5) main() — Demo usage and explanation of what is happening step-by-step
// ---------------------------
void main() {
  // STEP 1: Create manager (singleton) — ensures single central store of students
  StudentManager manager = StudentManager();
  print('Student Manager created. Current count: ${manager.count}\n');

  // STEP 2: Create Student objects (no direct public mutation of internals)
  Student s1 = Student('Ravi Kumar', 101, [85, 78, 92]);
  Student s2 = Student('Anita Sharma', 102, [91, 89, 94]);
  Student s3 = Student('Vikram Singh', 103, [55, 48, 60]);

  // STEP 3: Add students to manager (manager checks roll uniqueness)
  manager.addStudent(s1);
  manager.addStudent(s2);
  manager.addStudent(s3);
  print('Added 3 students. Current count: ${manager.count}\n');

  // STEP 4: Show all students — polymorphism in action: Person methods are implemented by Student
  print('--- Showing all students (initial) ---');
  manager.showAllStudents();

  // STEP 5: Find a student by roll and update marks
  int searchRoll = 103;
  Student? found = manager.findByRoll(searchRoll);
  if (found != null) {
    print('Found student with roll $searchRoll: ${found.name}');
    // Update marks (validates each mark)
    manager.updateMarks(searchRoll, [65, 70, 75]);
    print('Marks updated for roll $searchRoll.\n');
  } else {
    print('Student with roll $searchRoll not found.\n');
  }

  // STEP 6: Show that update reflects in output
  print('--- Showing all students (after update) ---');
  manager.showAllStudents();

  // STEP 7: Demonstrate removal
  int removeRoll = 102;
  bool removed = manager.removeStudentByRoll(removeRoll);
  print(removed ? 'Removed student with roll $removeRoll.\n' : 'No student removed.\n');

  // Final state
  print('--- Final students list ---');
  manager.showAllStudents();
  print('Final count: ${manager.count}');
}
