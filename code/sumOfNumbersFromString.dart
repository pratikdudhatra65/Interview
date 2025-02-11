int sumOfNumbersFromString(String numbersList) {
  if (numbersList.isEmpty) return 0;

  String regularExpressionCheck = ',|\n';
  if (numbersList.startsWith('//')) {
    var parts = numbersList.split('\n');
    if (parts.length > 1) {
      regularExpressionCheck = RegExp.escape(parts[0].substring(2));
      numbersList = parts.sublist(1).join('\n');
    }
  }
  var numList = numbersList
      .split(RegExp(regularExpressionCheck))
      .where((n) => n.isNotEmpty)
      .map(int.parse)
      .toList();
  var negatives = numList.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception(
        'Number list contain negative numbers: ${negatives.join(', ')}');
  }

  return numList.reduce((a, b) => a + b);
}

void main() {
  try {
    print(sumOfNumbersFromString("1\n2,3"));
    print(sumOfNumbersFromString("//;\n9;11;21"));
    print(sumOfNumbersFromString("//|\n7|9|5"));
    print(sumOfNumbersFromString("0,-12,4"));
  } catch (e) {
    print(e);
  }
}
