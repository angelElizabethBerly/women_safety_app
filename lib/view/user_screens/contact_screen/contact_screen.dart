import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/contact_screen_controller.dart';
import 'package:women_safety_app/model/contact_model.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context
        .read<ContactScreenController>()
        .askPermission(context, searchController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactScreenState = context.watch<ContactScreenController>();
    bool isSearching = searchController.text.isNotEmpty;
    bool listItemExist = contactScreenState.filteredContacts.isNotEmpty ||
        contactScreenState.contacts.isNotEmpty;

    return Scaffold(
        body: contactScreenState.contacts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          controller: searchController,
                          autofocus: true,
                          onChanged: (query) {
                            context
                                .read<ContactScreenController>()
                                .searchContacts(query);
                          },
                          decoration: InputDecoration(
                              hintText: "Search contacts",
                              prefixIcon: Icon(Icons.search))),
                    ),
                    listItemExist == true
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: isSearching == true
                                  ? contactScreenState.filteredContacts.length
                                  : contactScreenState.contacts.length,
                              itemBuilder: (context, index) {
                                Contact contact = isSearching == true
                                    ? contactScreenState.filteredContacts[index]
                                    : contactScreenState.contacts[index];
                                return ListTile(
                                    title: Text(contact.displayName),
                                    leading: contact.photo != null &&
                                            contact.photo!.isNotEmpty
                                        ? CircleAvatar(
                                            backgroundImage:
                                                MemoryImage(contact.photo!),
                                          )
                                        : CircleAvatar(
                                            backgroundColor:
                                                ColorConstants.primaryPink,
                                            child: Icon(Icons.person,
                                                color: ColorConstants
                                                    .primaryWhite),
                                          ),
                                    onTap: () {
                                      if (contact.phones.isNotEmpty) {
                                        final String phoneNum =
                                            contact.phones.elementAt(0).number;
                                        final String name = contact.displayName;
                                        context
                                            .read<ContactScreenController>()
                                            .addContact(
                                                TruContact(phoneNum, name),
                                                context);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "No phone number for this contact"),
                                                backgroundColor:
                                                    ColorConstants.primaryRed));
                                      }
                                    });
                              },
                            ),
                          )
                        : Container(
                            child: Text("Searching"),
                          )
                  ],
                ),
              ));
  }
}
