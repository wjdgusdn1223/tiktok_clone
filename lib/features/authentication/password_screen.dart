import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_isPasswordLengthValid() || !_isPasswordCharValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool _isPasswordLengthValid() {
    return _password.length >= 8 && _password.length <= 20;
  }

  bool _isPasswordCharValid() {
    final regExp = RegExp(r"^[A-Za-z0-9!@#$%^&*()_+,\.-:;<=>?@[\]^_`{|}~]+$");
    return regExp.hasMatch(_password);
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.size20,
                ),
                textAlign: TextAlign.left,
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      SizedBox(
                        width: Sizes.size20 + Sizes.size5,
                        child: Center(
                          child: GestureDetector(
                            onTap: _toggleObscureText,
                            child: FaIcon(
                              _obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              color: Colors.grey.shade500,
                              size: Sizes.size20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  hintText: "Make it strong!!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.size12,
                ),
              ),
              Gaps.v10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordLengthValid()
                        ? Colors.green.shade500
                        : Colors.grey.shade300,
                    size: Sizes.size16,
                  ),
                  Gaps.h5,
                  const Text(
                    '8 to 20 characters',
                    style: TextStyle(
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
              Gaps.v3,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordCharValid()
                        ? Colors.green.shade500
                        : Colors.grey.shade300,
                    size: Sizes.size16,
                  ),
                  Gaps.h5,
                  const Text(
                    'Letters, numbers, and special characters',
                    style: TextStyle(
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled:
                      !_isPasswordLengthValid() || !_isPasswordCharValid(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
