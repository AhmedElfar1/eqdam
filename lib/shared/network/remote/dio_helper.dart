import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    print('dioHelper Initialized');
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://fcm.googleapis.com/fcm/send',
          receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> postData({
    Map<String, dynamic> ?data
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAFoHuj50:APA91bHvSCwSpPqMrxmXWCLzIrsZwYyC-QIR1FZP-GQIzX-ZPDwUv7oG_APwFVG4hewD6kTx9CjDnK-_RjttJ0mFDzaPf0wJsBS32UREcgl_0JYFdExmOYjpnfWj-y_ygjgd0VEb84sI '
    };
    return await dio.post(
      'https://fcm.googleapis.com/fcm/send',
      data: data,
    );
  }
}
