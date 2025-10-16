bool isBalanced(String input) {
  final stack = <String>[];

  final matching = {')': '(', ']': '[', '}': '{'};

  for (var char in input.split('')) {
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    } else if (char == ')' || char == '}' || char == ']') {
      if (stack.isEmpty || stack.removeLast() != matching[char]) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

void main() {
  final examples = ["{what is (42)}?", "[text}", "{[[(a)b]c]d}"];

  for (var example in examples) {
    print("$example -> ${isBalanced(example) ? 'Balanced' : 'Not balanced'}");
  }
}
