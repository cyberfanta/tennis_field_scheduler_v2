class StatusBody {
  final int statusCode;
  final String body;

  StatusBody({required this.statusCode, required this.body});

  @override
  String toString() {
    return "StatusBody (response.statusCode: $statusCode, response.body: $body)";
  }
}
