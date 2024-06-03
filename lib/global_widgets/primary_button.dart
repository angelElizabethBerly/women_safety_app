import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.loading = false});
  final String title;
  final Function onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(ColorConstants.darkPink)),
            child: Text(title,
                style: TextStyle(
                    color: ColorConstants.primaryWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w300))));
  }
}
