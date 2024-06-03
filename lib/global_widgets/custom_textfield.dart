import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      this.labelText,
      this.controller,
      this.validate,
      this.onSave,
      this.maxLines,
      this.isPassword = false,
      this.enable = true,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.prefix,
      this.suffix,
      this.check});
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final String? Function(String?)? onSave;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final bool? check;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enable == true ? true : enable,
        maxLines: maxLines ?? 1,
        onSaved: onSave,
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: keyboardType ?? TextInputType.name,
        controller: controller,
        validator: validate,
        obscureText: isPassword == false ? false : isPassword,
        decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            labelText: labelText ?? "Label text",
            labelStyle: TextStyle(
                color: ColorConstants.darkPink, fontWeight: FontWeight.w200),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: ColorConstants.darkPink)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: ColorConstants.darkPink)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: ColorConstants.primaryRed)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: ColorConstants.primaryRed))));
  }
}
