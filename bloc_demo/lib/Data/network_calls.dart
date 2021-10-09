import 'dart:convert';

import 'package:bloc_demo/Models/posts_model.dart';
import 'package:bloc_demo/Models/user_model.dart';
import 'package:http/http.dart' as http;

class NetworkCalls {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    final usersUrl = Uri.parse(baseUrl + '/users');
    try {
      List<User> _users;
      final _response = await http.get(usersUrl);
      final _finalData = await jsonDecode(_response.body) as List;
      _users = _finalData.map((e) {
        return User(
          id: e['id'],
          name: e['name'],
          email: e['email'],
          phoneNumber: e['phone'],
        );
      }).toList();

      return _users;
    } catch (e) {
      // ignore: avoid_print
      print('error: $e');
      return [];
    }
  }

  Future<List<Post>> fetchUserPosts({required int userId}) async {
    final postsUrl = Uri.parse(baseUrl + '/posts?userId=$userId');

    try {
      final _response = await http.get(postsUrl);
      final _extractedData = jsonDecode(_response.body) as List;
      final list = _extractedData
          .map((post) => Post(
                userId: post['userId'],
                id: post['id'],
                title: post['title'],
                body: post['body'],
              ))
          .toList();

      return list;
    } catch (e) {
      // ignore: avoid_print
      print('error: $e');

      return [];
    }
  }
}
