import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height*0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height*0.2-27,
                decoration: const BoxDecoration(
                    color: Color(0xFF363567),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)
                    )
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0,10),
                          blurRadius: 50,
                          color: const Color(0xFF363567).withOpacity(0.23),
                        )
                      ]
                    ),
                    child:  TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: const Color(0xFF363567).withOpacity(0.5),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
          ),
                    ),
                  )
              ),
            ],
          ),
        )
      ],
    );
  }
}
