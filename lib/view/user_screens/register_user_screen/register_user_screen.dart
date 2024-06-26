// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/register_screen_controller.dart';
import 'package:women_safety_app/global_widgets/custom_textfield.dart';
import 'package:women_safety_app/global_widgets/primary_button.dart';
import 'package:women_safety_app/global_widgets/secondary_button.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/guardian_screens/guardian_register_screen/guardian_register_screen.dart';
import 'package:women_safety_app/view/user_screens/login_screen/login_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final formKey = GlobalKey<FormState>();
  final formData = Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    final registerScreenState = context.watch<RegisterScreenController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 70),
              Center(
                  child: Text(
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                    color: ColorConstants.darkPink),
              )),
              SizedBox(height: 25),
              CustomTextFieldWidget(
                  labelText: "Enter name",
                  prefix: Icon(Icons.person, color: ColorConstants.darkPink),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validate: (name) {
                    if (name!.isEmpty || name.length < 3) {
                      return "Enter valid name";
                    }
                    return null;
                  },
                  onSave: (name) {
                    formData["name"] = name ?? "";
                  }),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Enter phone number",
                  prefix: Icon(Icons.phone, color: ColorConstants.darkPink),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validate: (phone) {
                    if (phone!.isEmpty || phone.length != 10) {
                      return "Enter valid phone number";
                    }
                    return null;
                  },
                  onSave: (phone) {
                    formData["phone"] = phone ?? "";
                  }),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Enter email",
                  prefix:
                      Icon(Icons.mail_outline, color: ColorConstants.darkPink),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validate: (email) {
                    if (email!.isEmpty ||
                        email.length < 3 ||
                        !email.contains("@")) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                  onSave: (email) {
                    formData["userEmail"] = email ?? "";
                  }),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Enter guardian email",
                  prefix: Icon(Icons.mail, color: ColorConstants.darkPink),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validate: (guardEmail) {
                    if (guardEmail!.isEmpty ||
                        guardEmail.length < 3 ||
                        !guardEmail.contains("@")) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                  onSave: (guardEmail) {
                    formData["guardEmail"] = guardEmail ?? "";
                  }),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Enter password",
                  prefix: Icon(Icons.key, color: ColorConstants.darkPink),
                  isPassword: registerScreenState.isPasswordShown,
                  suffix: IconButton(
                      onPressed: () {
                        context.read<RegisterScreenController>().showPassword();
                      },
                      icon: registerScreenState.isPasswordShown
                          ? Icon(Icons.visibility_off,
                              color: ColorConstants.darkPink)
                          : Icon(Icons.visibility,
                              color: ColorConstants.darkPink)),
                  validate: (password) {
                    if (password!.isEmpty || password.length < 7) {
                      return "Enter valid password";
                    }
                    return null;
                  },
                  onSave: (password) {
                    formData["password"] = password ?? "";
                  }),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                  labelText: "Confirm password",
                  prefix: Icon(Icons.key, color: ColorConstants.darkPink),
                  isPassword: registerScreenState.isConfirmPasswordShown,
                  suffix: IconButton(
                      onPressed: () {
                        context
                            .read<RegisterScreenController>()
                            .showConfirmPassword();
                      },
                      icon: registerScreenState.isPasswordShown
                          ? Icon(Icons.visibility_off,
                              color: ColorConstants.darkPink)
                          : Icon(Icons.visibility,
                              color: ColorConstants.darkPink)),
                  validate: (password) {
                    if (password!.isEmpty || password.length < 7) {
                      return "Enter correct password";
                    }
                    return null;
                  },
                  onSave: (password) {
                    formData["rePassword"] = password ?? "";
                  }),
              SizedBox(height: 20),
              registerScreenState.isLoading
                  ? CircularProgressIndicator()
                  : PrimaryButtonWidget(
                      title: "Register",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onSubmit();
                        }
                      }),
              // Align(
              //     alignment: Alignment.centerRight,
              //     child: SecondaryButtonWidget(
              //         title: "Register as Guardian",
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) =>
              //                       GuardianRegisterScreen()));
              //         }))
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 15),
          ),
          SecondaryButtonWidget(
              title: "Login",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
    );
  }

  onSubmit() async {
    formKey.currentState!.save();
    if (formData["password"] != formData["rePassword"]) {
      context.read<RegisterScreenController>().dialogBox(
          context, "The Password and Confirm Password does not match");
    } else {
      context.read<RegisterScreenController>().onRegister(context,
          email: formData["userEmail"].toString(),
          password: formData["password"].toString(),
          name: formData['name'].toString(),
          phone: formData['phone'].toString(),
          emergEmail: formData['guardEmail'].toString(),
          type: 'user');
    }
    print(formData["userEmail"]);
    print(formData["password"]);
  }
}
