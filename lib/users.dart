import 'package:flutter/material.dart';
import 'package:quiz_app/navigation_widget_drawer.dart';
import 'change_theme_button_widget.dart';
import 'posts.dart';
import 'user.dart';
import 'package:http/http.dart' as http;
class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF363567),
        centerTitle: true,
        title: Text("Users",style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
      backgroundColor: const Color(0xFF363567),
      body: Column(
        children: [
          FutureBuilder<List<User>>(
            future: fetchUsers(),
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
                                builder: (context) =>  Posts(userId: id,),
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
                                            height: 400,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Colors.blue[500],
                                                    radius: 68,
                                                    child: const CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          "https://img.freepik.com/free-vector/hand-drawn-world-book-day-illustration_23-2148871666.jpg?w=740&t=st=1680638481~exp=1680639081~hmac=4f45b9821695876a2e7dd6f82c1912d5c9b5c164a7df8cc2bd2b889e0c3f1a0e"),
                                                      radius: 60,
                                                    ), //CircleAvatar
                                                  ), //CircleAvatar
                                                  const SizedBox(
                                                    height: 20,
                                                  ), //SizedBox
                                                  Text(
                                                    snapshot.data![index].username,
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
                                                    'Email: ${snapshot.data![index].email}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black87,
                                                    ), //TextStyle
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),//Text

                                                  Text('Company Name: ${snapshot.data![index].company.name}',style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),),//SizedBox
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(snapshot.data![index].id.toString(),style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),),
                                                   //SizedBox
                                                ],
                                              ), //Column
                                            ), //Padding
                                          ), //SizedBox
                                        ), //Card
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
                children:  [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
Future<List<User>> fetchUsers () async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200){
    return userFromJson(response.body);
  }
  else {
    throw Exception('error');
  }
}
