import 'dart:io';
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
      'Authorization':
          'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
    };

    final Map<String, dynamic> body = {
      'identifier': model.username,
      'password': model.password,
    };

    try {
      final response = await http.post(
          Uri.parse('${Constant.domain}/api/auth/local'),
          headers: headers,
          body: body);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final userResponse = UserResponseModel.fromJson(jsonResponse);
        await prefs.setInt('id', userResponse.user?.id ?? 0);
        await prefs.setString('token', 'var');
        await prefs.setString('name', userResponse.user?.username ?? 'Ahmet');
        print(userResponse.user?.id);
        await Grock.toRemove(BaseScaffold());
      } else {
        print('Hata kodu: ${response.statusCode}');
        print('Hata mesajı: ${response.body}');
      }
    } catch (e) {
      print('Hata Oluştu: $e');
    }

    return null;
  }
}
