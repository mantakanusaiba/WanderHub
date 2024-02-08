import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message.dart';
import 'messageService.dart';
import 'package:intl/intl.dart';

class MessagePage extends StatefulWidget {
  String receiverID;
  String receiverEmail;
  MessagePage({required this.receiverID, required this.receiverEmail});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  var messageController = TextEditingController();
  final MessageService messageService = MessageService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  Widget textMessageForm() {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: TextFormField(
              controller: messageController,
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () async {
                if (messageController.text.isNotEmpty) {
                  await messageService.sendMessage(
                      widget.receiverID, widget.receiverEmail, messageController.text);
                  messageController.clear();
                }
              },
              icon: Icon(Icons.send),
              color: Colors.cyan[800],
            ),
          )
        ],
      ),
    );
  }

  Widget chatBox(String message, bool sentByCurrentUser) {
    final chatBoxColor = sentByCurrentUser ? Colors.green : Colors.blue;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: chatBoxColor,
      ),
      child: Text(message,
        style: TextStyle(fontSize: 18,
          color:Colors.white,
      ),),
    );
  }

  Widget messageItem(Message message) {
    String messageSent = DateFormat('MMMM d, yyyy HH:mm').format(message.timeSent!.toDate());
    var alignment, crossAxisAlignment, seenStatus, seenColor;

    if (message.receiverID == _auth.currentUser!.uid && message.messageSeen != true) {
      messageService.updateSeenStatus(message, _auth.currentUser!.uid, widget.receiverID);
    }

    if (message.senderID == _auth.currentUser!.uid) {
      alignment = Alignment.centerRight;
      crossAxisAlignment = CrossAxisAlignment.end;

      if (message.messageSeen == false) {
        seenStatus = "unseen";
        seenColor = Colors.red;
      } else {
        seenStatus = "seen at ${DateFormat('MMMM d, yyyy HH:mm').format(message.timeSeen!.toDate())}";
        seenColor = Colors.green;
      }
    } else {
      alignment = Alignment.centerLeft;
      crossAxisAlignment = CrossAxisAlignment.start;
      seenStatus = '';
    }

    return Container(
      padding: EdgeInsets.all(5),
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text("${message.senderEmail}"),
          chatBox(message.message!, message.senderID == _auth.currentUser!.uid),
          Text("${messageSent}"),
          Text("${seenStatus}", style: TextStyle(fontSize: 12, color: seenColor),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.receiverEmail,
          style: TextStyle(
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: StreamBuilder<List<Message>>(
                stream: messageService.getMessages(_auth.currentUser!.uid, widget.receiverID),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messageList = snapshot.data;
                    return ListView(
                      reverse: true,
                      children: messageList!.map((message) => messageItem(message)).toList(),
                    );
                  } else {
                    return Text("Data Not found");
                  }
                },
              ),
            ),
            Divider(
              height: 30,
              color: Colors.black,
              indent: 5,
              endIndent: 5,
              thickness: 0.8,
            ),
            Expanded(flex: 2, child: textMessageForm()),
          ],
        ),
      ),
    );
  }
}
