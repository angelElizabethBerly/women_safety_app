import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed;
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 15, color: ColorConstants.darkPink),
        ));
  }
}
