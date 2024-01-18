import 'user.dart';
import 'databaseService.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';

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
        title: Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[200],
      body: StreamBuilder<CustomUser>(
        stream: DatabaseService().getUserByUserID(widget.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
            );
          } else if (snapshot.hasData) {
            CustomUser? customUser = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 75,
                  backgroundImage: customUser?.profileImageUrl != null
                      ? NetworkImage(customUser!.profileImageUrl!)
                      : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2irsFFS2xbDT5vhBymqMRzykWjMkNirupdg&usqp=CAU') as ImageProvider<Object>?,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Name: ${customUser?.name}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          "Email: ${customUser?.email}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          "Phone No.: ${customUser?.phone}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          "ID: ${customUser?.uid}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          "Role: ${customUser?.role}",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Pacifico-Regular',
                          ),
                        ),
                        SizedBox(height: 22),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {
                    _handleHomeScreenButtonPress(context);
                  },
                  child: Text(
                    "Return Home",
                    style: TextStyle(
                      color: Colors.cyan[800],
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Data Not Found",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}