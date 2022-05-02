import 'package:dio/dio.dart';
import 'constants.dart';

class Server {
  static Future<Response<dynamic>> getMovies() {
    Future<Response<dynamic>> futuremovie = Dio().get(Constants.apiUrlTMDB);
    return futuremovie;
  }

  static Future<Response<dynamic>> getChuckNorris(){
    Future<Response<dynamic>> futurenorris = Dio().get(Constants.chuckNorrisApi);
    return futurenorris;
  }
}
