import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String userName;
  final String email;
  User({required this.email, required this.id, required this.userName});

  User.fromMap({required Map<String, dynamic> data})
      : email = data['email']!,
        id = data['id']!,
        userName = data['username']!;
}

class UserHttpService {
  final http.Client _client;
  UserHttpService({required http.Client client}) : _client = client;

  final url = 'https://jsonplaceholder.typicode.com/users/1';
  Future<User> getUserData() async {
    try {
      final userDataResponse = await _client.get(Uri.parse(url));

      return User.fromMap(
          data: json.decode(userDataResponse.body) as Map<String, dynamic>);
    } catch (e) {
      log("error occured is $e");
      throw Exception('something went wrong');
    }
  }
}
