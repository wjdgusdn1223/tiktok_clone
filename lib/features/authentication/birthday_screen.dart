import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/modal_popup.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  late final DateTime _initialDate;

  DateTime? _date;
  bool _disabled = false;

  @override
  void initState() {
    super.initState();
    var current = DateTime.now();
    _initialDate = DateTime(current.year - 12, current.month, current.day);
    _setTextFieldDate(_initialDate);
  }

  void _setTextFieldDate(DateTime date) {
    _date = date;

    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(
      text: textDate,
    );
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _showDatePicker(Widget child) {
    setState(() {
      _disabled = true;
    });

    showCupertinoModalPopup(
      context: context,
      builder: (context) => ModalPopup(child: child),
      barrierColor: Colors.grey.shade100.withOpacity(0.0),
    ).whenComplete(
      () => setState(() {
        _disabled = false;
      }),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
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
            children: [
              Gaps.v40,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'When\'s your birthday?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.size20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Gaps.v10,
                        Text(
                          'Your birthday won\'t be shown publicly',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.cakeCandles,
                      size: Sizes.size80,
                    ),
                  )
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => _showDatePicker(
                  CupertinoDatePicker(
                    onDateTimeChanged: _setTextFieldDate,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _date ?? _initialDate,
                    maximumDate: _initialDate,
                  ),
                ),
                child: TextField(
                  enabled: false,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: _disabled,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
