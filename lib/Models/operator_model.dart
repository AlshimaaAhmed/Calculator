abstract class Operatorr {
  late String symbol;
  double operating(double num1, double num2);
}

class Adding extends Operatorr {
  @override
  String symbol = "+";

  @override
  double operating(double num1, double num2) {
    return num1 + num2;
  }
}

class Subtraction extends Operatorr {
  @override
  String symbol = "-";

  @override
  double operating(double num1, double num2) {
    return num1 - num2;
  }
}

class Multiplying extends Operatorr {
  @override
  String symbol = "×";

  @override
  double operating(double num1, double num2) {
    return num1 * num2;
  }
}

class Division extends Operatorr {
  @override
  String symbol = "÷";

  @override
  double operating(double num1, double num2) {
    if (num2 != 0) {
      return num1 / num2;
    } else {
      return -1;
    }
  }
}

class Mod extends Operatorr {
  @override
  String symbol = "%";

  @override
  double operating(double num1, double num2) {
    return num1 % num2;
  }
}
