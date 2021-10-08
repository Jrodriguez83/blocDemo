import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final api = NetworkCalls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Viewer'),
      ),
      body: FutureBuilder(
          initialData: [User(id: 0, name: '', email: '', phoneNumber: '')],
          future: api.fetchUsers(),
          builder: (ctx, snapshot) {
            final data = snapshot.data as List<User>;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: [
                ...data.map((user) => userWidget(user: user, context: context))
              ],
            );
          }),
    );
  }
}

Widget userWidget({required User user, required BuildContext context}) {
  return Card(
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/user_detail', arguments: user);
      },
      title: Text(user.name),
    ),
  );
}
