import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    const Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        height: 1.3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    const Text(
                      "Follow the rules!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        height: 1.3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    const Text(
                      "Enjoy the ride",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        height: 1.3,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  color: Colors.white,
                  selectedColor: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
