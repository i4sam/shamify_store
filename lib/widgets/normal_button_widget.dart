import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class NormalButtonWidget extends StatelessWidget {
  const NormalButtonWidget({
    super.key,
    this.icon,
    required this.label,
    required this.function,
  });

  final IconData? icon;
  final String label;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SubtitleWidget(label: label, color: Colors.white),
    );
  }
}
