class LoadingMessage {
  final bool isLoading;
  final String message;

  LoadingMessage({required this.isLoading, required this.message});

  @override
  String toString() {
    return "LoadingMessage (isLoading: $isLoading, message: $message)";
  }
}
