
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final res = await http.get(Uri.parse('\$baseUrl/posts'));
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      // Map posts to simple transaction-like objects
      return data.take(20).map((e) => {
        'id': e['id'],
        'amount': ((e['id'] * 37) % 1000) + 10, // fake computed amount
        'title': e['title']
      }).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<Map<String, dynamic>> postTransaction(double amount) async {
    final res = await http.post(Uri.parse('\$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': 'send', 'amount': amount}));
    if (res.statusCode == 201) {
      final data = json.decode(res.body);
      return {'id': data['id'], 'amount': amount};
    } else {
      throw Exception('Failed to post transaction');
    }
  }
}
