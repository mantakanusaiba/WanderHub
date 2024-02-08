import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanderhub/databaseService.dart';
import 'package:wanderhub/message.dart';
import 'package:wanderhub/messagePage.dart';
import 'package:wanderhub/messageService.dart';
import 'package:wanderhub/notificationService.dart';
import 'package:wanderhub/tour.dart';
import 'package:wanderhub/user.dart';

import 'main.dart';

class Home2 extends StatefulWidget {
  final String uid;
  Home2(this.uid);

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  void _handleHomeScreenButtonPress(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService.notificationPayload.stream.listen((payload) {
      // Navigator.pushNamed(context, event! );
      if (payload != null)
        Navigator.pushNamed(context, '/notice_page',
            arguments: {'payload': payload});
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget showTile(CustomUser user) {
    if (_auth.currentUser!.uid != user.uid) {
      return Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.teal, width: 2.0),
        ),
        child: ListTile(
          title: Text(
            "${user.name}",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Pacifico-Regular',
            ),
          ),
          subtitle: StreamBuilder<List<Message>>(
              stream: MessageService()
                  .getUnseenMessages(_auth.currentUser!.uid, user.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final unseenMessageList = snapshot.data;
                  return Text(
                      "${user.email} (${unseenMessageList?.length} unseen messages)",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Pacifico-Regular',
                      ));
                } else {
                  return Text("${user.email}",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Pacifico-Regular',
                      ));
                }
              }),
          tileColor: Colors.white,
          splashColor: Colors.black38,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessagePage(
                        receiverID: user.uid, receiverEmail: user.email)));
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget showUserList() {
    return StreamBuilder<List<CustomUser>>(
        stream: DatabaseService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data;
            return Column(
              children: userList!.map((user) => showTile(user)).toList(),
            );
          } else {
            return Text("Data Not found");
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat \u{1F4AC}',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.cyan[800],
            fontFamily: 'Pacifico-Regular',
          ),
        ),
      ),
      backgroundColor: Colors.cyan[100],
      body: StreamBuilder<CustomUser>(
          stream: DatabaseService().getUserByUserID(widget.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CustomUser? customUser = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: [
                    Text(
                      "Me: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${customUser?.name} ",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                    Text(
                      "${customUser?.email} ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Cox's Bazar Bound: \nMeet Our Adventurous Travellers! ",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Pacifico-Regular',
                          color: Colors.teal[800]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    showUserList(),
                    SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool? logoutConfirmed =
                            await _showLogoutConfirmationDialog(context);
                        if (logoutConfirmed == true) {
                          await DatabaseService().logoutUser();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You are logged out.',
                                style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red[600],
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                          );
                        }
                      },
                      child: Text("Logout",
                          style: TextStyle(
                              fontFamily: 'Pacifico-Regular',
                              color: Colors.teal[800])),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _handleHomeScreenButtonPress(context);
                      },
                      child: Text(
                        "Return Home",
                        style: TextStyle(
                            fontFamily: 'Pacifico-Regular',
                            color: Colors.teal[800]),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Data Not Found");
            }
          }),
    );
  }
}

Future<bool?> _showLogoutConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                color: Colors.green,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
