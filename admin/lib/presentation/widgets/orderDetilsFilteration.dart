import 'package:flutter/material.dart';

class FilterDropdownButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const FilterDropdownButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(label),
            const SizedBox(width: 5),
            Icon(icon, size: 18),
          ],
        ),
      ),
    );
  }
}
