import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/users.dart';
import 'comment.dart';
class Comments extends StatefulWidget {
  int postId;
   Comments({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchComments(widget.postId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Comments",style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //const Text("Data"),
          FutureBuilder<List<Comment>>(
            future: fetchComments(widget.postId),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Users(),
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
                                      color: Colors.blueAccent
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
                                            width: 350,
                                            height: 450,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ), //SizedBox
                                                  Text(
                                                    snapshot.data![index].name,
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
Future<List<Comment>> fetchComments (int posId) async {
final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$posId'));
if(response.statusCode==200){
  return commentFromJson(response.body);
}else{
  throw Exception('error occurred');
}
}
