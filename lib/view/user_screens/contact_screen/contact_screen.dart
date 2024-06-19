import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/contact_screen_controller.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    context.read<ContactScreenController>().askPermission(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactScreenState = context.watch<ContactScreenController>();

    return Scaffold(
        body: contactScreenState.contacts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contactScreenState.contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = contactScreenState.contacts[index];
                  return ListTile(
                      title: Text(contact.displayName),
                      subtitle: Text(contact.phones.isEmpty
                          ? "No number added"
                          : contact.phones.first.number),
                      leading:
                          contact.photo != null && contact.photo!.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(contact.photo!),
                                )
                              : CircleAvatar(
                                  backgroundColor: ColorConstants.primaryPink,
                                  child: Icon(Icons.person,
                                      color: ColorConstants.primaryWhite),
                                ));
                },
              ));
  }
}
