class Customexception implements Exception {
  final String message;
  Customexception({required this.message});
  @override
  toString() {
    return message;
  }
}
