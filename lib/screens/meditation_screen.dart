import 'package:flutter/material.dart';
import 'dart:async';
import 'package:app_prueba_meditacion/models/breathing_exercise.dart';
// Cambia el constructor
class MeditationScreen extends StatefulWidget {
  final BreathingExercise exercise;

  const MeditationScreen({super.key, required this.exercise});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {

      int _secondsElapsed = 0;
late Timer _sessionTimer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Controlador total de la respiración (4+6+6 = 16 segundos)
    _controller = AnimationController(
  vsync: this,
  duration: Duration(seconds: widget.exercise.totalSeconds),
);

// En initState(), separa la curva del controlador
_animation = TweenSequence<double>([
  TweenSequenceItem(
    tween: Tween<double>(begin: 180, end: 260),
    weight: widget.exercise.inhaleSeconds.toDouble(),
  ),
  TweenSequenceItem(
    tween: Tween<double>(begin: 260, end: 260),
    weight: widget.exercise.holdSeconds.toDouble(),
  ),
  TweenSequenceItem(
    tween: Tween<double>(begin: 260, end: 180),
    weight: widget.exercise.exhaleSeconds.toDouble(),
  ),
]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Repetir infinitamente
    _controller.repeat();

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
  setState(() {
    _secondsElapsed++;
  });
});
  }
String getFormattedTime() {
  final minutes = _secondsElapsed ~/ 60; // división entera
  final seconds = _secondsElapsed % 60;  // resto
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}
  @override
 void dispose() {
  _controller.dispose();
  _sessionTimer.cancel();
  super.dispose(); // siempre lo último
}

  String getPhaseText() {
  final total = widget.exercise.totalSeconds;
  final inhale = widget.exercise.inhaleSeconds;
  final hold = widget.exercise.holdSeconds;
  
  final current = _controller.value * total; // en segundos

  if (current < inhale + 0.8) return 'Inhala';        // ← más delay aquí
  if (current < inhale + hold + 0.3) return 'Mantén'; // ← menos delay aquí
  return 'Exhala';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meditación',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFFEE6C4D),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondoapp.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Contenido
          Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Solo el círculo animado
      AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: _animation.value,
            height: _animation.value,
            decoration: const BoxDecoration(
              color: Color(0xFFEE6C4D),
              shape: BoxShape.circle,
            ),
          );
        },
      ),
      const SizedBox(height: 30),
      // Texto fijo debajo
      AnimatedBuilder(
        animation: _controller, // Para que se actualice cada frame
        builder: (context, child) {
          return Text(
            getPhaseText(),
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              
            ),
          );
        },
      ),const SizedBox(height: 16),
Text(
  getFormattedTime(),
  style: const TextStyle(
    fontSize: 20,
    color: Colors.white70,
    letterSpacing: 2,
  ),
),
    ],
  ),
),
        ],
      ),
    );
  }
}