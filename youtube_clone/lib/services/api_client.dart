import 'package:dio/dio.dart';

class ApiClient {
  //Creating an object of dio
  Dio _dio = new Dio();
  Future<dynamic> getVideos() async {
    const URL =
        'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=100&regionCode=IN&key=AIzaSyDSTfb4EHc059fClggG-h88FnXigQ0kJE4 ';
    final Response response = await _dio.get(URL);
    //print(response.data);
    //print(response.data.runtimeType);
    return response.data['items'];
    //making a network call
    //asyncronized call
    //it creates a new thread
  }
}
