
class Question {
  final String? key;
  final String? question;

  Question(this.key, this.question);

  @override
  String toString() {
    return ("$question");
  }
}