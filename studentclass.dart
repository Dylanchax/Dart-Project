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

// define the class for a class roster
class ClassRoster {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void checkPresence() {
    for (var student in students) {
      print('${student.name}: ${student.present ? 'present' : 'absent'}');
    }
  }
}

void main() {
  // Create a new class roster
  var roster = ClassRoster();

  // Add some students to the roster
  roster.addStudent(BasicStudent('Samantha'));
  roster.addStudent(BasicStudent('Tariro'));

  // Mark some students as present
  roster.students[0].markPresent();
  roster.students[2].markPresent();

  // Check the presence of the class
  roster.checkPresence();
}
