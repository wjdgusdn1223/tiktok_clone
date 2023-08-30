import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size32,
            ),
            border: Border.all(
              color: _isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade300,
            ),
            boxShadow: [
              BoxShadow(
                color: _isSelected
                    ? Theme.of(context).primaryColor.withOpacity(0.4)
                    : Colors.black.withOpacity(0.06),
                blurRadius: 6,
                spreadRadius: 4,
              ),
            ],
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          ),
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black,
            ),
            duration: const Duration(milliseconds: 300),
            child: Text(
              widget.interest,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
