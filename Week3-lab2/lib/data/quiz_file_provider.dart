import 'dart:io';

class QuizFileProvider {
  final String filepath;

  QuizFileProvider(this.filepath);

  String readFile() {
    final file = File(filepath);
    return file.readAsStringSync();
  }

  void writeFile(String content) {
    final file = File(filepath);
    file.writeAsStringSync(content);
  }
}
