import 'package:dump_pay/models/api_result.dart';
import 'package:dump_pay/utils/endpoint.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<ApiResult> getEmailToken(String email) async {
    String url = ApiEndPoint.baseUrl + ApiEndPoint.getEmailToken;

    try {
      http.Response response =
          await http.post(Uri.parse(url), body: {'email': email});
      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: 'Email token sent Successfully',
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: 'Field to send email token',
            response: response);
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(success: false, message: 'Error occurred getting email');
    }
  }

  static Future<ApiResult> getLogin(
      String email, String password, String device_name) async {
    String url = ApiEndPoint.baseUrl + ApiEndPoint.getLogin;

    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'email': email,
        "password": password,
        "device_name": device_name
      });
      if (response.statusCode == 200) {
        return ApiResult(
            success: true, message: 'login Successful', response: response);
      } else {
        return ApiResult(
            success: false, message: 'Field to login ', response: response);
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(success: false, message: 'Error occurred ');
    }
  }

  static Future<ApiResult> verifyEmailToken(
      {required email, required token}) async {
    String url = ApiEndPoint.baseUrl + ApiEndPoint.VerifyEmailToken;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: {'email': email, 'token': token});
      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: 'Email token sent Successfully',
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: 'Field to verify email',
            response: response);
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(success: false, message: 'Error occurred getting email');
    }
  }

  static Future<ApiResult> register(
      {required email,
      required full_name,
      required username,
      required countryCode,
      required password,
      required device_name}) async {
    String url = ApiEndPoint.baseUrl + ApiEndPoint.Register;
    try {
      http.Response response = await http.post(Uri.parse(url), body: {
        'email': email,
        "full_name": full_name,
        'username': username,
        'country': countryCode,
        'password': password,
        'device_name': device_name
      });
      if (response.statusCode == 200) {
        return ApiResult(
            success: true,
            message: 'Registration Successfully',
            response: response);
      } else {
        return ApiResult(
            success: false,
            message: 'Field to register user',
            response: response);
      }
    } catch (e) {
      print('Error $e');
      return ApiResult(
          success: false, message: 'Error occurred Registering user');
    }
  }
}
