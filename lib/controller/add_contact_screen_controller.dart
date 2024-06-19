import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:women_safety_app/model/contact_model.dart';
import 'package:women_safety_app/utils/db_services.dart';

class AddContactScreenController with ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<TruContact> contactList = [];
  int count = 0;

  void showList() {
    Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TruContact>> contactListFuture =
          databaseHelper.getContactList();
      contactListFuture.then((value) {
        contactList = value;
        count = value.length;
        notifyListeners();
      });
    });
  }

  void deleteTruContact(TruContact contact, BuildContext context) async {
    int result = await databaseHelper.deleteContact(contact.id);
    if (result != 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Removed contact successfully")));
      showList();
    }
  }
}
