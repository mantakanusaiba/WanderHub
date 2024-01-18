import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wanderhub/chatbot.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatBot _chatBot = ChatBot();
  final TextEditingController _textController = TextEditingController();

  List<ChatMessage> _messages = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUserMessage: true,
    );

    setState(() {
      _messages.add(message);
    });

    _firestore.collection('message').add({
      'text': text,
      'isUserMessage': true,
      'timestamp': FieldValue.serverTimestamp(),
    });

    String response = _chatBot.getResponse(text);
    ChatMessage botMessage = ChatMessage(
      text: response,
      isUserMessage: false,
    );

    setState(() {
      _messages.add(botMessage);
    });

    _firestore.collection('message').add({
      'text': response,
      'isUserMessage': false,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat \u{1F4AC}',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.cyan[800],
            fontFamily: 'Pacifico-Regular',
          ),
        ),
        actions: [],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.cyan[100],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Questions ? Chat with us !',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      margin: EdgeInsets.only(),
                    ),
                    Text(
                      ' Support is online',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('message')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                List<QueryDocumentSnapshot<Object?>> docs =
                    snapshot.data!.docs;
                List<ChatMessage> messages = [];

                for (var doc in docs) {
                  Map<String, dynamic> data =
                  doc.data() as Map<String, dynamic>;
                  String text = data['text'];
                  bool isUserMessage = data['isUserMessage'];

                  messages.add(ChatMessage(
                    text: text,
                    isUserMessage: isUserMessage,
                  ));
                }

                _messages = messages;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index];
                  },
                );
              },
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.cyan[800],
            ),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: 200.0,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}