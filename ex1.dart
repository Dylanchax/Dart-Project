void main(List<String> arguments) {
  String firstName = arguments[0];

  String lastName = arguments[1];

  DateTime currentTime = DateTime.now();

  print('Hello, ${firstName} ${lastName}, \n${currentTime}');
}
