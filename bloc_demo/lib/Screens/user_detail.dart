import 'package:bloc_demo/Models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Name: ${user.name}'),
            Text('Name: ${user.email}'),
            Text('Name: ${user.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
