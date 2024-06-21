import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/add_contact_screen_controller.dart';
import 'package:women_safety_app/global_widgets/primary_button.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/user_screens/contact_screen/contact_screen.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AddContactScreenController>().showList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addContactScreenState = context.watch<AddContactScreenController>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorConstants.darkPink,
            iconTheme: IconThemeData(color: ColorConstants.primaryWhite)),
        body: SafeArea(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                PrimaryButtonWidget(
                    title: "Add Trusted Contacts",
                    onPressed: () async {
                      bool result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactScreen()));
                      if (result == true) {
                        context.read<AddContactScreenController>().showList();
                      }
                    }),
                Expanded(
                  child: ListView.builder(
                    itemCount: addContactScreenState.count,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 5,
                          shadowColor: ColorConstants.darkPink,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(addContactScreenState
                                  .contactList[index].name),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await FlutterPhoneDirectCaller
                                            .callNumber(addContactScreenState
                                                .contactList[index].number);
                                      },
                                      icon: Icon(Icons.call,
                                          color: ColorConstants.darkPink)),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<AddContactScreenController>()
                                            .deleteTruContact(
                                                addContactScreenState
                                                    .contactList[index],
                                                context);
                                      },
                                      icon: Icon(Icons.delete,
                                          color: ColorConstants.darkPink)),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
