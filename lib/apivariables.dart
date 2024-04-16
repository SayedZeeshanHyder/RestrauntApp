class ApiVariables
{

  static const baseApi = "http://192.168.43.22:5000";
  static const emailApi = "$baseApi/mail";
  static const notificationApi = "$baseApi/noti";

  static const headers = {
  'Content-type': 'application/json',
  };

  static const gemApiKey = 'AIzaSyCjeib_v_TYW1BlXWh8mjK1vUyePVRQRQk';
  static const gemApi = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$gemApiKey';


  static const webUrl = 'https://www.tripadvisor.in/Restaurant_Review-g304554-d5071038-Reviews-Crimson_Navi_Mumbai-Mumbai_Maharashtra.html';
}