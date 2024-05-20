import 'package:flutter/material.dart';

class IconProgress extends StatelessWidget {
  final double dimension;
  final Color? color;

  const IconProgress({super.key, this.dimension = 16.0, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CircularProgressIndicator(strokeWidth: 2.0, color: color,),
    );
  }
}
