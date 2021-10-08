part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UsersLoaded extends UserState {
  final List<User> userList;
  UsersLoaded({required this.userList});
}
