class Task {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final String location;
  final int mealsCount;
  final String assignedTime;
  final TaskStatus status;
  final double progressPercentage;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.location,
    required this.mealsCount,
    required this.assignedTime,
    required this.status,
    required this.progressPercentage,
  });
}

enum TaskStatus {
  pending,
  inProgress,
  completed,
} 