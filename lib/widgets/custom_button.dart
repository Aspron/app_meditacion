import 'package:flutter/material.dart';
import '../themes/colors.dart';
import '../themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color; // opcional, si no se pasa usa el primary

  const CustomButton({super.key, required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.primary,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.white38,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(
            label,
            style: AppTextStyles.button,
          ),
        ),
      ),
    );
  }
}