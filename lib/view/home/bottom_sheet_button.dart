import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? child;
  final Color? color;

  const BottomSheetButton(
      {super.key, this.color, required this.onPressed, this.leadingIcon, required this.child});
  const BottomSheetButton.icon(
      {super.key,
      this.color,
      required this.onPressed,
      required Widget icon,
      required Widget label})
      : leadingIcon = icon,
        child = label;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      leadingIcon: leadingIcon,
      onPressed: onPressed,
      requestFocusOnHover: false,
      style: MenuItemButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: color,
        foregroundColor: color,
      ),
      child: child,
    );
  }
}
