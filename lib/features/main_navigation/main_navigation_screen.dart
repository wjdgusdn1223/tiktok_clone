import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/stf_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  bool _isPostVideoButtonTapDown = false;

  void _resetPostVideoEffect() {
    setState(() {
      _isPostVideoButtonTapDown = false;
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTapUp(TapUpDetails details) {
    _resetPostVideoEffect();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Record Video',
            ),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void _onPostVideoButtonTapDown(TapDownDetails details) {
    setState(() {
      _isPostVideoButtonTapDown = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
            vertical: Sizes.size10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavTab(
                    text: 'Home',
                    icon: FontAwesomeIcons.house,
                    selectedIcon: FontAwesomeIcons.house,
                    isSelected: _selectedIndex == 0,
                    onTap: () => _onTap(0),
                  ),
                  NavTab(
                    text: 'Discover',
                    icon: FontAwesomeIcons.magnifyingGlass,
                    selectedIcon: FontAwesomeIcons.searchengin,
                    isSelected: _selectedIndex == 1,
                    onTap: () => _onTap(1),
                  ),
                  //Gaps.h24,
                  Expanded(
                    child: GestureDetector(
                      onTapUp: _onPostVideoButtonTapUp,
                      onTapDown: _onPostVideoButtonTapDown,
                      onTapCancel: _resetPostVideoEffect,
                      behavior: HitTestBehavior.translucent,
                      child: SizedBox(
                        child: Center(
                          child: PostVideoButton(
                              isPressed: _isPostVideoButtonTapDown),
                        ),
                      ),
                    ),
                  ),
                  //Gaps.h24,
                  NavTab(
                    text: 'Inbox',
                    icon: FontAwesomeIcons.message,
                    selectedIcon: FontAwesomeIcons.solidMessage,
                    isSelected: _selectedIndex == 3,
                    onTap: () => _onTap(3),
                  ),
                  NavTab(
                    text: 'Profile',
                    icon: FontAwesomeIcons.user,
                    selectedIcon: FontAwesomeIcons.solidUser,
                    isSelected: _selectedIndex == 4,
                    onTap: () => _onTap(4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
