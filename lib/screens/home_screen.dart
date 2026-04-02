import 'package:flutter/material.dart';
import 'meditation_screen.dart';
import '../widgets/custom_button.dart';
import '../themes/colors.dart';
import '../themes/text_styles.dart';
import 'package:app_prueba_meditacion/screens/exercise_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
  children: [
    // Fondo
    Positioned.fill(
      child: Image.asset(
        'assets/images/fondoapp.jpg', // ruta de tu imagen
        fit: BoxFit.cover, // ocupa toda la pantalla
      ),
    ),

    // Contenido encima
    Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Meditación', style: AppTextStyles.title),
          SizedBox(height: 20),
          CustomButton(
            label: 'Empezar',
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const ExerciseSelectionScreen()),
              );
            },
          ),
          
        ],
      ),
    ),
  ],
),
    );
  }
}