import 'package:flutter/material.dart';

class ToSignupButton extends StatelessWidget {
  const ToSignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Signup',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 14,
        ),
      ),
    );
  }
}