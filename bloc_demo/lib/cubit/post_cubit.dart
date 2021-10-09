import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Data/network_calls.dart';
import 'package:bloc_demo/Models/posts_model.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required this.user}) : super(PostInitial());
  final calls = NetworkCalls();
  final User user;
  void getUserPosts() {
    calls
        .fetchUserPosts(userId: user.id)
        .then((posts) => emit(PostsLoaded(posts: posts)));
  }
}
