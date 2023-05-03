import 'dart:io';

// Define the interface for a student
abstract class Student {
  String get name;
  bool get present;
  void markPresent();
  void markAbsent();
}

// Define a basic implementation of the student interface
class BasicStudent implements Student {
  String name;
  bool present = false;

  BasicStudent(this.name);

  @override
  void markAbsent() {
    present = false;
  }

  @override
  void markPresent() {
    present = true;
  }
}

// Define the class for a class roster
class ClassRoster {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void checkPresence() {
    for (var i = 0; i < students.length; i++) {
      var student = students[i];
      print(
          '${i + 1}. ${student.name}: ${student.present ? 'present' : 'absent'}');
    }
  }

  Student getStudentByIndex(int index) {
    if (index >= 1 && index <= students.length) {
      return students[index - 1];
    } else {
      return null;
    }
  }

  void prepareReport() {
    var presentCount = 0;
    var absentCount = 0;

    for (var student in students) {
      if (student.present) {
        presentCount++;
      } else {
        absentCount++;
      }
    }

    print('Report for ${DateTime.now()}');
    print('Present: $presentCount');
    print('Absent: $absentCount');
  }
}

void main(List<String> arguments) {
  // Create a new class roster
  var roster = ClassRoster();

  // Import data from CSV file
  var file = File('students.csv');
  var lines = file.readAsLinesSync();

  // Add students to the roster from the CSV data
  for (var line in lines) {
    var parts = line.split(',');
    var name = parts[0];
    var present = parts[1] == '1';
    var student = BasicStudent(name);
    if (present) {
      student.markPresent();
    } else {
      student.markAbsent();
    }
    roster.addStudent(student);
  }

  // Check the presence of the class
  roster.checkPresence();

  // If an index argument is provided, mark that student as present or absent
  if (arguments.isNotEmpty) {
    var index = int.tryParse(arguments[0]);
    if (index != null) {
      var student = roster.getStudentByIndex(index);
      if (student != null) {
        var input = stdin.readLineSync();
        if (input == '1') {
          student.markPresent();
        } else {
          student.markAbsent();
        }
        roster.checkPresence();
        roster.prepareReport();
      }
    }
  }
}
