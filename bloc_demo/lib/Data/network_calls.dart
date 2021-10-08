import 'dart:convert';

import 'package:bloc_demo/Models/user_model.dart';
import 'package:http/http.dart' as http;

class NetworkCalls {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<User>> fetchUsers() async {
    try {
      List<User> _users;
      final _response = await http.get(url);
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
}
