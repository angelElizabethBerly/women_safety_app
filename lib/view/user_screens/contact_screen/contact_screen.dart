import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<void> askPermission() async {
    PermissionStatus permissionStatus = await Permission.contacts.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Contacts Screen')));
  }
}
