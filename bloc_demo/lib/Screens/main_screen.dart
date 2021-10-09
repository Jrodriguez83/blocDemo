import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:bloc_demo/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  final api = NetworkCalls();
  AppBarMode _appBarMode = AppBarMode.title;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).fetchUsers();
    final _userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: CustomTitle(appBarMode: _appBarMode),
        actions: [
          IconButton(
              onPressed: () =>
                  _appBarMode = _userCubit.setAppBarMode(_appBarMode),
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is! UsersLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = state.userList;

          return _buildUserList(users: users, context: context);
        },
      ),
    );
  }
}

Widget _buildUserList({users, context}) => ListView(
      children: [
        ...users.map((user) => _buildUserWidget(user: user, context: context))
      ],
    );

Widget _buildUserWidget({required User user, required BuildContext context}) {
  return Card(
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/user_detail', arguments: user);
      },
      title: Text(user.name),
    ),
  );
}

class CustomTitle extends StatefulWidget {
  const CustomTitle({Key? key, required this.appBarMode}) : super(key: key);
  final AppBarMode appBarMode;
  @override
  _CustomTitleState createState() => _CustomTitleState(appBarMode);
}

class _CustomTitleState extends State<CustomTitle> {
  _CustomTitleState(this.appBarMode);
  final AppBarMode appBarMode;
  @override
  Widget build(BuildContext context) {
    return appBarMode == AppBarMode.title
        ? const Text('User Viewer')
        : const TextField();
  }
}
