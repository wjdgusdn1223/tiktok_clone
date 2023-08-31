import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 75) {
      if (!_showTitle) {
        setState(() {
          _showTitle = true;
        });
      }
    } else {
      if (_showTitle) {
        setState(() {
          _showTitle = false;
        });
      }
    }
  }

  void _onTapNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Sizes.size64),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: _showTitle
                    ? Colors.grey.shade300
                    : Colors.grey.withOpacity(0),
              ),
            ),
          ),
          padding: const EdgeInsets.only(
            top: Sizes.size24,
            bottom: Sizes.size10,
          ),
          child: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: const SafeArea(
              child: Text(
                "Choose your interests",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: Sizes.size24,
        ),
        child: Scrollbar(
          controller: _scrollController,
          radius: const Radius.circular(5),
          thickness: Sizes.size6,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size24,
                right: Sizes.size24,
                bottom: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v12,
                  const Text(
                    "Choose your interests",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                  ),
                  Gaps.v12,
                  Text(
                    "Get better video recommendations",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Gaps.v32,
                  Wrap(
                    runSpacing: Sizes.size16,
                    spacing: Sizes.size10,
                    children: [
                      for (var interest in interests)
                        InterestButton(interest: interest)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: const EdgeInsets.only(
            top: Sizes.size12,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gaps.h12,
              Expanded(
                child: GestureDetector(
                  onTap: _onTapNext,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      color: Colors.white,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
