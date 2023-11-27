import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              method: 'GET',
            ))
        .then(
      (response) {
        return response;
      },
    ).catchError(
      (e) {
        if (e is DioException) {
          return e.response!;
        }
        return e;
      },
    );
  }
}
