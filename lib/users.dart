import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:const Text("Users",style: TextStyle(fontFamily: 'Times New Roman',fontSize: 22,color: Colors.white,),textAlign: TextAlign.center,),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //const Text("data"),
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
                                      color: Colors.blueAccent,
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
                                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg86bYqZEAQhvq_mHIQ8sNWqriV608Yi-sKA&usqp=CAU"),
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
                                                  ),),//SizedBox
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
