import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:permission_handler/permission_handler.dart';

class ContactScreenController with ChangeNotifier {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];
  List<Contact> get fContact =>
      filteredContacts.isEmpty ? contacts : filteredContacts;

  Future<void> askPermission(
      BuildContext context, TextEditingController controller) async {
    PermissionStatus permissionStatus = await getContactsPermission();
    if (permissionStatus == PermissionStatus.granted) {
      getAllContacts();
      // controller.addListener(() {
      // filterContacts(controller);
      // });
    } else {
      handleInvalidPermissions(permissionStatus, context);
    }
  }

  Future<PermissionStatus> getContactsPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  handleInvalidPermissions(
      PermissionStatus permissionStatus, BuildContext context) {
    if (permissionStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Access to contacts denied")));
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Try again")));
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true);
    contacts = _contacts;
    notifyListeners();
  }

  filterContacts(TextEditingController controller) {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (controller.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String searchTerm = controller.text.toLowerCase();
        String contactName = element.displayName.toLowerCase();
        bool nameFound = contactName.contains(searchTerm);
        if (nameFound == true) {
          filteredContacts = _contacts;
          notifyListeners();
        }
        return true;
      });
    }
  }

  searchContacts(String query) {
    if (query.isEmpty) {
      filteredContacts = [];
    } else {
      filteredContacts = contacts.where(
        (contact) {
          return contact.displayName
              .toLowerCase()
              .contains(query.toLowerCase());
        },
      ).toList();
    }
    notifyListeners();
  }
}
