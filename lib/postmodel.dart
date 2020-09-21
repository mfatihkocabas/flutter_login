import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'http://ikincilt-temp-api.herokuapp.com/user/save';

List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}


Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  //final dyn = data.toJson();
//  return json.encode(dyn);
}

class Post {
  String nameSurname;
  String email;
  String password;

  Post({
    this.nameSurname,
    this.email,
    this.password,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    nameSurname: json['nameSurname'],
    email: json['email'],
    password: json['password']
  );


}
Future<Post> getPost() async{
  final response = await http.get('$url');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post) async{
  final response = await http.post('$url',
      body: postToJson(post)
  );
  return response;
}


Future<List<Post>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}