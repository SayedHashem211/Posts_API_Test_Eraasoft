import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PostsAdding extends StatefulWidget {
  const PostsAdding({Key? key}) : super(key: key);

  @override
  State<PostsAdding> createState() => _PostsAddingState();
}

class _PostsAddingState extends State<PostsAdding> {

  Future addPost()async{
    var response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body:jsonEncode({
          "userId": 2,
          "id": 101,
          "title": "new post using http package",
          "body": "Listen to me..\nIf you as a human being transform yourself, you affect the consciousness of the rest of the world."
        },)

    );
    var responseBody = jsonDecode(response.body);

    print(responseBody);   // مش عارف هنا ليه بيطبع ال id بس في ال terminal لانه المفروض يرجع values ال map كلها
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Add Posts to API",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.grey
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white54,
          child: ElevatedButton(
            onPressed: (){
              addPost();
            },
            child: const Text("Add Post", style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 25,
              fontWeight: FontWeight.w900
            ),),
          ),
        ),
      ),
    );
  }
}
