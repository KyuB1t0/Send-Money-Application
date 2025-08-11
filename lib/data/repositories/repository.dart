import 'package:flutter/widgets.dart';
import 'package:send_money_application/data/api/api_provider.dart';
import 'package:send_money_application/features/auth/models/login_response.dart';

class MayaRepository {
  final provider = ApiProvider();

  // final storage = FlutterSecureStorage();

  Future<LoginResponse> login(String username, String password) async {
    try {
      final loginData = await provider.loginRequest(username, password);
      debugPrint('🔐 Login data: $loginData');
      return loginData; // Already a LoginResponse
    } catch (e) {
      debugPrint("❌ $e");
      throw Exception("Failed to load email and password");
    }
  }

  /// Fetch transactions
  Future<List<Map<String, dynamic>>> getTransactions(String username) async {
    try {
      return await provider.fetchTransactions(username);
    } catch (e) {
      debugPrint("❌ Repository fetch error: $e");
      rethrow;
    }
  }

  /// Post transaction
  Future<Map<String, dynamic>> sendTransaction(
    int amount,
    String username,
  ) async {
    try {
      return await provider.postTransaction(
        amount,
        username, // pass username to provider
      );
    } catch (e) {
      debugPrint("❌ Repository post error: $e");
      rethrow;
    }
  }

  // Future<LogoutResponse> logout(String token) async {
  //   try {
  //     final message = await provider.logoutRequest(token);
  //     debugPrint('👋 Logout Response: $message');
  //     return LogoutResponse.fromJson(message.toJson());
  //   } catch (e) {
  //     debugPrint('❌ Logout Error: $e');
  //     throw Exception("Logout failed");
  //   }
  // }
}
