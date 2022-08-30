class Failure{
  final String message;
  final StackTrace? stackTrace;

  Failure({required this.message, this.stackTrace});

  @override
  String toString() {
    return message;
  }
}