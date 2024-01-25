import 'dart:convert';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/models/searchDoctor/search_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISearchService {
  ISearchService(this.dio);

  Future<search_doctor_model?> fetchLogin();
  final Dio dio;
}

class LoginService extends ISearchService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<search_doctor_model?> fetchLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':
          'Bearer 0b6c05e02ee081f0f9d3d733e6dadefcc7d3e5bb2c10f3195927e2794002eefdf5f6f2774afeba9188a133385082a36818baca38f93bf05be5a9c68672a84f3efde436ce64afeedf5e3d79f36980e9e8cd9ed4f41939dd2a666f386118604991d5ada44ca4ca9c02881e1692e8cd5ad4f6016cea4390fb0931ae7c3ae9ad573e'
    };

    try {
      final response = await http.post(
          Uri.parse('${Constant.domain}/api/auth/local'),
          headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final userResponse = search_doctor_model.fromJson(jsonResponse);
      }
    } catch (e) {}

    return null;
  }
}
