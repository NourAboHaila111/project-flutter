import 'package:dio/dio.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.136:8000/api/',
        receiveDataWhenStatusError: true,

      ),

    );
  }

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic> ?data,
    String? token,
    String? lang='en',
  }) async
  {
    dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token,
  };
    dio.options.headers["Authorization"] =CachHelper.getData(key: 'token');
        // "Bearer"+' ' +'${CachHelper.getData(key: 'token')}';
    // dio.options.headers = {
    //   // 'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
    //   // 'Content-Length': '<calculated when request is sent>',
    //   // 'Host': '<calculated when request is sent>',
    //   // 'User-Agent': 'PostmanRuntime/7.32.2',
    //   // 'Accept': '*/*',
    //     //   // 'Accept-Encoding': 'gzip, deflate, br',
    //   // 'Connection': 'keep-alive',
    //   // 'Authorization': token??'',
    //
    // };
    return await dio.get(url!, queryParameters: query );
  }
//******************************************
//   static Future<Response>postData(
//       {
//         required String url,
//         Map<String, dynamic> ?query,
//         required Map<String,dynamic> ?data,
//       })async
//   {
//     return await dio.post(
//         url,
//         queryParameters: query,
//         data: data
//     );
//   }
// *************************************
  static Future<Response>postFormData(
  {
    required  String ?url,
    Map<String, dynamic> ?query,
    required FormData ?data,

    String? token,
    String? lang='en',
  })async
{
  dio.options.headers = {
    'lang':lang,
    'Content-Type':'multipart/form-data',
    'Authorization':token??'',
  };
  return await dio.post(url!,queryParameters: query,data: data);
}
  static Future<Response>postData(
      {
        required  String ?url,
        Map<String, dynamic> ?query,
        required Map<String,dynamic> ?data,
        String? token,
        String? lang='en',
      })async
  {
    dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token??'',
    };
    return await dio.post(url!,queryParameters: query,data: data);
  }

  static Future<Response>putData(
      {
        required  String ?url,
        Map<String, dynamic> ?query,
        required Map<String,dynamic> ?data,
        String? token,
        String? lang='en',
      })async
  {
    dio.options.headers = {
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token??'',
    };
    return await dio.put(url!,queryParameters: query,data: data);
  }

  static Future<Response>postLogout(
      {
        required String url,
       required String ?token,
      })async
  {
    dio.options.headers={
      'Authorization':token??'',
    };
    return await dio.post(url);
  }

  // static Future<Response> putData({
  //   required String url,
  //   Map<String, dynamic> ?query,
  //   required Map<String, dynamic>data,
  //   String ?token,
  // }) async
  // {
  //   dio.options.headers = {
  //     'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
  //     'Content-Length': '<calculated when request is sent>',
  //     'Host': '<calculated when request is sent>',
  //     'User-Agent': 'PostmanRuntime/7.32.2',
  //     'Accept': '*/*',
  //     'Accept-Encoding': 'gzip, deflate, br',
  //     'Connection': 'keep-alive',
  //     'Authorization': token ?? '',
  //   };
  //   return await dio.put(url, queryParameters: query, data: data);
  // }


  static Future<Response> getWithToken({
     String? url,
     String? token
  }) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));

    try {
      final response = await dio.get(url!);
      return response;
    } catch (e) {
      throw e;
    }
  }

}