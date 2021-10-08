import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  final FAKE_DATA = [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      },
    }
  ];

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
