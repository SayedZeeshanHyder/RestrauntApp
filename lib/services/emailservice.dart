import 'dart:convert';
import 'package:http/http.dart' as https;

import '../apivariables.dart';
class EmailServices
{
  static const emailApi = ApiVariables.emailApi;
  static sendEmail(String email)
  async {
    try {
      final body = jsonEncode({
        "email": email,
        "subject": "Thank you Zeeshan for creating your account from our Restraunt App. Make your First Order and get 10% discount",
        "text": "Congratulations Account Created Successfully"
      });
      await https.post(Uri.parse(emailApi), headers: ApiVariables.headers, body: body);
      print("Email Sent");

    }catch(e)
    {
      print("Error in Api Call : $e");
    }
  }
}