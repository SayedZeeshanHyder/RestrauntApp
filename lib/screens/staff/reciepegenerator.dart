import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mprapp/apivariables.dart';

class ReciepeGenerator extends StatefulWidget {
  const ReciepeGenerator({super.key});

  @override
  State<ReciepeGenerator> createState() => _ReciepeGenerator();
}

class _ReciepeGenerator extends State<ReciepeGenerator> {
  static final auth = FirebaseAuth.instance;
  ChatUser myself = ChatUser(id: '1', firstName: "Chef");
  ChatUser bot = ChatUser(id: '2', firstName: 'Reciepe Generator Bot');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var filteredMessage = "is ${m.text} a food or not Reply with yes or no";

    var data = {
      "contents": [
        {
          "parts": [
            {"text": filteredMessage}
          ]
        }
      ]
    };

    final response1 = await http
        .post(Uri.parse(ApiVariables.gemApi), headers: ApiVariables.headers, body: jsonEncode(data));
    if(response1.statusCode == 200) {
      final decodedResponse = jsonDecode(response1.body);
      if(decodedResponse["candidates"][0]['content']["parts"][0]['text'] == "yes") {
        var filteredMessage2 = "Generate Reciepe for ${m.text}";
        var data2 = {
          "contents": [
            {
              "parts": [
                {"text": filteredMessage2}
              ]
            }
          ]
        };

        final response2 = await http
            .post(Uri.parse(ApiVariables.gemApi), headers: ApiVariables.headers,
            body: jsonEncode(data2));
        final decodedResponse2 = jsonDecode(response2.body);
        ChatMessage m1 = ChatMessage(
            text: decodedResponse2['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
      }
      else
        {
          ChatMessage m1 = ChatMessage(
              text: "Sorry \"${m.text}\" is not recognized as a food product",
              user: bot,
              createdAt: DateTime.now());
          allMessages.insert(0, m1);
        }
    }

    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Text("Reciepe Generator Bot"),
      ),
      body: DashChat(
        inputOptions: InputOptions(
        ),
        onSend: (ChatMessage m) {
          getdata(m);
        },
        messages: allMessages, currentUser: myself,
      ),
    );
  }
}