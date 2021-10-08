import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:bloc_demo/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final api = NetworkCalls();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).fetchUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Viewer'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is! UsersLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = state.userList;

          return userList(users: users, context: context);
        },
      ),
    );
  }
}

Widget userList({users, context}) => ListView(
      children: [
        ...users.map((user) => userWidget(user: user, context: context))
      ],
    );

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
