class BreathingExercise {
  final String name;
  final String description;
  final int inhaleSeconds;
  final int holdSeconds;
  final int exhaleSeconds;

  const BreathingExercise({
    required this.name,
    required this.description,
    required this.inhaleSeconds,
    required this.holdSeconds,
    required this.exhaleSeconds,
  });

  // Duración total de un ciclo
  int get totalSeconds => inhaleSeconds + holdSeconds + exhaleSeconds;
}