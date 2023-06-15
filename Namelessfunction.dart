void main() {
  const list = ['apples', 'bananas', 'oranges'];

  list
      .map((item) => item.toUpperCase())
      .forEach((item) => print('$item: ${item.length}'));
}
