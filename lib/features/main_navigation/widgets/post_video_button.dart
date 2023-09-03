import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.isPressed,
  });

  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? 1.15 : 1,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            right: 3,
            bottom: isPressed ? 2 : 0,
            child: Container(
              height: Sizes.size32,
              width: Sizes.size40 + Sizes.size1,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff65D5EB),
                borderRadius: BorderRadius.circular(Sizes.size9),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 3,
            top: isPressed ? 2 : 0,
            child: Container(
              height: Sizes.size32,
              width: Sizes.size40 + Sizes.size1,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size9),
              ),
            ),
          ),
          Container(
            height: Sizes.size32,
            width: Sizes.size40 + Sizes.size1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size9),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size16 + Sizes.size2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
