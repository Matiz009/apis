import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/comments.dart';
import 'package:quiz_app/post.dart';
import 'package:http/http.dart' as http;
class Posts extends StatefulWidget {
  int id;
  Posts({Key? key, required this.id}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLeagues(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Data",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
                color: Colors.blueAccent),
          ),
          FutureBuilder<List<Post>>(
            future: fetchLeagues(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(3.0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: (){
                            int id= snapshot.data![index].id;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Comments( postId: id),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.blueAccent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data![index].title,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        );
              }),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
Future<List<Post>> fetchLeagues(int id) async {
  final res = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (res.statusCode == 200) {
    return postFromJson(res.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('error');
  }
}