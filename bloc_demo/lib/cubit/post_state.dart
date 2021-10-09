part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostsLoaded extends PostState {
  PostsLoaded({required this.posts});

  final List<Post> posts;
}
