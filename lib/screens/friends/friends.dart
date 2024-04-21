import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mprapp/apivariables.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  static final auth = FirebaseAuth.instance;
  ChatUser myself = ChatUser(id: '1', firstName: auth.currentUser!.displayName.toString());
  ChatUser bot = ChatUser(id: '2', firstName: 'Restaurant ChatBot');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var filteredMessage = "${m.text} (answer as a restaurant chatbot of Restaurant named Crimson Royale)";

    var data = {
      "contents": [
        {
          "parts": [
            {"text": filteredMessage}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ApiVariables.gemApi), headers: ApiVariables.headers, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
      } else {
        print("error occured");
      }
    }).catchError((e) {});

    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text("Chatbot"),
      ),
      body: DashChat(
        onSend: (ChatMessage m) {
          getdata(m);
        },
        messages: allMessages, currentUser: myself,
      ),
    );
  }
}