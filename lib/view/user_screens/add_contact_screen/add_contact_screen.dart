import 'package:flutter/material.dart';
import 'package:women_safety_app/global_widgets/primary_button.dart';
import 'package:women_safety_app/view/user_screens/contact_screen/contact_screen.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            PrimaryButtonWidget(
                title: "Add Trusted Contacts",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactScreen()));
                })
          ],
        ),
      )),
    );
  }
}
