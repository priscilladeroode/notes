import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final double width;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
