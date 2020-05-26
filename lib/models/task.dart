class Task {
  final String name;
  final int severity;
  final DateTime dateCreated;
  bool isCompleted;

  Task({this.name, this.severity, this.dateCreated, this.isCompleted = false});

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  Map<String, dynamic> toJson() => {
        "name": this.name,
        "severity": this.severity,
        "dateCreated": this.dateCreated.toIso8601String(),
        "isCompleted": this.isCompleted
      };
}
