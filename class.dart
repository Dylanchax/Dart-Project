class FindAverage {
  num call(num first, num second) => (first + second) / 2;
}

main(list<string> args) {
  var avg = FindAverage();

  print(avg(2, 4));
  print(avg(2.8, 4.2));
}
