import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final calls = NetworkCalls();
  void fetchUsers() {
    calls
        .fetchUsers()
        .then((userList) => emit(UsersLoaded(userList: userList)));
  }
}
