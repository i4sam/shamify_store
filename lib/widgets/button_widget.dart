import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    required this.expanded,
    required this.label,
    required this.function,
    this.width, 
  });

  final IconData? icon;
  final String label;
  final bool expanded;
  final VoidCallback function;
  final double? width; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      width: width, 
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: function,
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (!expanded) {
      return SubtitleWidget(label: label, color: Colors.white);
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: Colors.white),
            if (icon != null) const SizedBox(width: 12),
            SubtitleWidget(label: label, color: Colors.white),
          ],
        ),
      );
    }
  }
}
