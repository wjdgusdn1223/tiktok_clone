import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.5,
          duration: const Duration(milliseconds: 70),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: Colors.white,
                size: Sizes.size24,
              ),
              Gaps.v5,
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
