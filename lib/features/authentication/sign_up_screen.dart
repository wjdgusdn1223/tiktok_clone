import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Sign up for TikTok',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                text: 'Use email & password',
                icon: FaIcon(FontAwesomeIcons.user),
              ),
              Gaps.v14,
              AuthButton(
                text: 'Continue with Facebook',
                icon: FaIcon(FontAwesomeIcons.facebook),
              ),
              Gaps.v14,
              AuthButton(
                text: 'Continue with Apple',
                icon: FaIcon(FontAwesomeIcons.apple),
              ),
              Gaps.v14,
              AuthButton(
                text: 'Continue with Google',
                icon: FaIcon(FontAwesomeIcons.google),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade50,
        elevation: 1,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => onLoginTap(context),
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}