import 'dart:convert';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/models/login/login_request.dart';
import 'package:Psynexa/models/login/login_response.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILoginService {
  ILoginService(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);
  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, dynamic> body = {
      'email': model.username,
      'pass': model.password,
    };

    try {
      final response = await http.post(
          Uri.parse('${Constant.domain}/api/client/login'),
          headers: headers,
          body: body);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final userResponse = UserResponseModel.fromJson(jsonResponse);
        await prefs.setString('id', userResponse.client!.sId!);
        await prefs.setString('token', userResponse.token!);
        await prefs.setString('name', userResponse.client!.name!);
        await prefs.setString('surname', userResponse.client!.surName!);
        await Grock.toRemove(BaseScaffold());
      }
    } catch (e) {}

    return null;
  }
}
