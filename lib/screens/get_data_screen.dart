import 'package:api_http_eraasoft/screens/post_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../models/post_model.dart';

class PostsReview extends StatefulWidget {
  const PostsReview({Key? key}) : super(key: key);

  @override
  State<PostsReview> createState() => _PostsReviewState();
}

class _PostsReviewState extends State<PostsReview> {
  List allPosts = [];

  Future getPost() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(url));

    var responseBody = jsonDecode(response.body);

    setState(() {
      allPosts.addAll(responseBody);
    });
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Get Posts From API",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white38
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const PostsAdding();
              }));
            },
            child: const Text("Post Page",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple
            ),),
          ),
        ],
      ),
      body: allPosts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: allPosts.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 7, bottom: 7, right: 8),
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.greenAccent,
                  child: Text("${allPosts[index]}"),
                );
              }),
    );
  }
}

// i used this method as i had some problems in model method :)

/*
using model method

  List AllPosts =[];

  Future<Post>getData()async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception("No Posts Available");
    }
  }
  late Future<Post> PostModel;
  @override
  void initState() {
    super.initState();
    PostModel = getData();
  }
 */
