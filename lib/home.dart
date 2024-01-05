import 'user.dart';
import 'databaseService.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String uid;
  Home(this.uid);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  void _handleHomeScreenButtonPress(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile",
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<CustomUser>(
          stream: DatabaseService().getUserByUserID(widget.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CustomUser? customUser = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Text("Name: ", style: TextStyle(fontSize: 25,
                        fontFamily: 'Pacifico-Regular',
                      ),),
                    Text("${customUser?.name} ", style: TextStyle(fontSize: 20,
                      fontFamily: 'Pacifico-Regular',),),

                    SizedBox(height: 20,),
                    Text("Email: ", style: TextStyle(fontSize: 25),),
                    Text("${customUser?.email} ", style: TextStyle(fontSize: 20,
                      fontFamily: 'Pacifico-Regular',),),

                    SizedBox(height: 20,),
                    Text("ID: ", style: TextStyle(fontSize: 25),),
                    Text("${customUser?.uid} ", style: TextStyle(fontSize: 20,
                      fontFamily: 'Pacifico-Regular',),),

                    SizedBox(height: 20,),
                    Text("Role: ", style: TextStyle(fontSize: 25),),
                    Text("${customUser?.role} ", style: TextStyle(fontSize: 20,
                      fontFamily: 'Pacifico-Regular',),),

                    SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed: () {
                        _handleHomeScreenButtonPress(context);
                      },
                      child: Text("Return Home",
                        style: TextStyle(
                        fontFamily: 'Pacifico-Regular',),
                      )
                      /* onPressed: () async{
                          await DatabaseService().logoutUser();
                        },
                        child: Text("Log Out"))
                        */
                    )
                  ],
                ),
              );
            } else {
              return Text("Data Not Found",
                style: TextStyle(fontSize: 20,
                  fontFamily: 'Pacifico-Regular'),
              );
            }
          }
      ),
    );
  }
}
