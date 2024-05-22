import 'package:flutter/material.dart';

class SubPageSection extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final Widget label;
  final Widget description;

  const SubPageSection(
      {super.key,
      this.onPressed,
      required this.icon,
      required this.label,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            description,
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: onPressed,
                  icon: icon,
                  label: label,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
