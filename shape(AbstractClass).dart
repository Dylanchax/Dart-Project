abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') {
      return Circle();
    } else if (type == 'rectangle') {
      return Rectangle();
    } else {
      throw UnsupportedError('Shape type $type is not supported.');
    }
  }

  void draw();
}

class Circle implements Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print('Drawing a rectangle');
  }
}

void main() {
  try {
    Shape circle = Shape('circle');

    circle.draw(); // Output: Drawing a circle

    Shape rectangle = Shape('rectangle');

    rectangle.draw(); // Output: Drawing a rectangle

    Shape unsupported = Shape('triangle');

    unsupported.draw(); // Throws UnsupportedError
  } catch (e) {
    print(e); // Output: UnsupportedError: Shape type triangle is not supported.
  }
}
