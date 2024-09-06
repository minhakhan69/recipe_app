
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../models/postmodel.dart';

class ApiTesting extends StatefulWidget {
  const ApiTesting({super.key});

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  Future<List<PostModel>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    print(response.body);

    if(response.statusCode==200){
      for(Map i in data) {
        posts.add(PostModel.fromJson(i));
      }
      return posts;
    }
    return [];
  }


  List<PostModel> posts=[];

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: getPostApi(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  width: 350,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text(posts[index].body.toString(),),
                      Text(posts[index].userId.toString(),),
                      Text(posts[index].id.toString(),),
                      Text(posts[index].title.toString(),),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
