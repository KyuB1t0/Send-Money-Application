import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:send_money_application/data/api/app_constant/app_constants.dart';
import 'package:send_money_application/data/api/logging.dart';
import 'package:send_money_application/features/auth/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: Duration(milliseconds: 50000),
      receiveTimeout: Duration(milliseconds: 50000),
    ),
  )..interceptors.add(Logging());

  // Local storage for posted transactions
  final List<Map<String, dynamic>> _localTransactions = [];

  Future<LoginResponse> loginRequest(String username, String password) async {
    try {
      await _dio.post(
        'users',
        data: {"username": username, "password": password},
      );

      final fakeToken = "fake_jwt_${DateTime.now().millisecondsSinceEpoch}";
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstant.TOKEN, fakeToken);

      debugPrint("🔐 Token saved: $fakeToken");

      return LoginResponse(
        userInfo: UserInfo(token: fakeToken, username: username),
      );
    } on DioError catch (e) {
      debugPrint("ERROR[${e.response?.statusCode}] => PATH: posts");
      throw Exception("Login failed");
    }
  }

  Future<List<Map<String, dynamic>>> fetchTransactions(String username) async {
    try {
      final res = await _dio.get(
        'posts',
        options: Options(
          headers: {
            'Authorization': 'Bearer your_token_here',
            'Content-Type': 'application/json',
          },
        ),
      );

      List<Map<String, dynamic>> apiData = [];

      if (res.statusCode == 200) {
        final List data = res.data;
        apiData =
            data.map((e) {
              return {
                'id': e['id'],
                'amount': ((e['id'] * 37) % 1000) + 10,
                'title': e['title'],
                'username': username, // ✅ para mag-match sa filter
              };
            }).toList();
      }

      final allTransactions = [..._localTransactions, ...apiData];
      return allTransactions.where((t) => t['username'] == username).toList();
    } on DioError catch (e) {
      debugPrint("❌ Fetch transactions error: ${e.message}");
      throw Exception('Failed to load transactions');
    }
  }

  Future<Map<String, dynamic>> postTransaction(
    int amount,
    String username,
  ) async {
    try {
      final transaction = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'amount': amount,
        'username': username,
        'title': 'send',
      };

      // Save locally so fetch can return it
      _localTransactions.add(transaction);

      // Simulate API post (API will ignore username)
      await _dio.post(
        'posts',
        data: transaction,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      debugPrint("✅ Transaction posted locally: $transaction");
      return transaction;
    } on DioError catch (e) {
      debugPrint("❌ Post transaction error: ${e.message}");
      throw Exception('Failed to post transaction');
    }
  }
}
