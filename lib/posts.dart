import 'package:flutter/material.dart';
import 'package:quiz_app/navigation_widget_drawer.dart';
import 'comments.dart';
import 'post.dart';
import 'package:http/http.dart' as http;
class Posts extends StatefulWidget {
  int userId;
  Posts({Key? key,required this.userId}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLeagues(widget.userId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF363567),
        centerTitle: true,
        title: Text("Posts",style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //const Text("data"),
          FutureBuilder<List<Post>>(
            future: fetchLeagues(widget.userId),
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
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF363567),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: 50,
                                          shadowColor: Colors.black,
                                          color: Colors.blueAccent[100],
                                          child: SizedBox(
                                            width: 300,
                                            height: 480,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ), //SizedBox
                                                  Text(
                                                    snapshot.data![index].title,
                                                    style: const TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w500,
                                                    ), //TextStyle
                                                  ), //Text
                                                  const SizedBox(
                                                    height: 30,
                                                  ), //SizedBox
                                                   Text(
                                                    snapshot.data![index].body,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                    ), //TextStyle
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),//Text
                                                  Text(snapshot.data![index].id.toString(),style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),),//SizedBox
                                                  //SizedBox
                                                ],
                                              ), //Column
                                            ), //Padding
                                          ), //SizedBox
                                        ),
                                      ],
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
Future<List<Post>> fetchLeagues(int userId) async {
  final res = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$userId'));
  if (res.statusCode == 200) {
    return postFromJson(res.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('error');
  }
}