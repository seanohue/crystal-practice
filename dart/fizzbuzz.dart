void main() {
  fizz(n) => n % 3 ==  0 ? "Fizz" : "";
  buzz(n) => n % 5 == 0 ? "Buzz" : "";
  number(n) => n % 3 == 0 || n % 5 == 0 ? "" : n;
  for (num i = 0; i++ < 100;) {
    print( "${fizz(i)}${buzz(i)} ${number(i)}" );
  }
}