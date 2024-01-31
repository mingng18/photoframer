class SimpleMaths {
  static String evalExpression(String expression) {
    List<String> parts = expression.split('/');
    if (parts.length != 2) {
      return expression;
    }
    double numerator = double.parse(parts[0]);
    double denominator = double.parse(parts[1]);

    if (denominator == 0) {
      return "0";
    }

    double division = numerator / denominator;

    return division.toStringAsFixed(1);
  }
}
