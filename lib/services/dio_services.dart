import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_services;

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

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .post(
      url,
      data: dio_services.FormData.fromMap(map),
      options: Options(
        responseType: ResponseType.json,
        method: 'POST',
      ),
    )
        .then(
      (response) {
        print(response.headers);
        print(response.data);
        print(response.statusCode);
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
