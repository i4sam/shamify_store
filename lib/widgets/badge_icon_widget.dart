import 'package:flutter/material.dart';

class BadgeIconWidget extends StatelessWidget {
  const BadgeIconWidget({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(label),
      child: Icon(icon),
    );
  }
}
