import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;

  const FormButton({
    super.key,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size12),
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade100 : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 200),
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
