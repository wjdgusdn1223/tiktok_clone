import 'package:flutter/material.dart';

class ModalPopup extends StatelessWidget {
  final Widget child;

  const ModalPopup({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SafeArea(
        top: false,
        child: child,
      ),
    );
  }
}
