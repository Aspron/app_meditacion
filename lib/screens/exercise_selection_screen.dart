import 'package:flutter/material.dart';
import '../data/exercises_data.dart';
import '../models/breathing_exercise.dart';
import '../themes/colors.dart';
import 'meditation_screen.dart';
import 'package:app_prueba_meditacion/screens/meditation_screen.dart';

class ExerciseSelectionScreen extends StatelessWidget {
  const ExerciseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elige tu ejercicio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return _ExerciseCard(exercise: exercise);
        },
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final BreathingExercise exercise;

  const _ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          exercise.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(exercise.description),
            const SizedBox(height: 8),
            Text(
              '${exercise.inhaleSeconds}s inhala · ${exercise.holdSeconds}s mantén · ${exercise.exhaleSeconds}s exhala',
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MeditationScreen(exercise: exercise),
            ),
          );
        },
      ),
    );
  }
}