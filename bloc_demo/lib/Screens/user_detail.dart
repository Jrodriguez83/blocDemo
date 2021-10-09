import 'package:bloc_demo/Models/posts_model.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:bloc_demo/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostCubit>(context).getUserPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is! PostsLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final posts = state.posts;
          return ListView(
            children: [
              ...posts.map((post) => ListTile(
                    title: Text(post.title),
                  ))
            ],
          );
        },
      ),
    );
  }
}
