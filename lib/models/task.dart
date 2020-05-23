class Task {
  final String name;
  final int severity;
  bool isCompleted;

  Task({this.name, this.severity, this.isCompleted = false});

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }
}
