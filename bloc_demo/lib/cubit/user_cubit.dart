import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

enum AppBarMode {
  title,
  searchBox,
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final calls = NetworkCalls();
  void fetchUsers() {
    calls
        .fetchUsers()
        .then((userList) => emit(UsersLoaded(userList: userList)));
  }

  AppBarMode setAppBarMode(AppBarMode appBarMode) {
    if (appBarMode == AppBarMode.title) {
      return AppBarMode.searchBox;
    } else {
      return AppBarMode.title;
    }
  }
}
