import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money_application/core/theme/od_colors.dart';
import 'package:send_money_application/widgets/auto_size_intertext.dart';

class WalletScreen extends StatefulWidget {
  final String username;
  const WalletScreen({super.key, required this.username});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double _balance = 500.00;
  bool _hidden = false;

  @override
  Widget build(BuildContext context) {
    final display = _hidden ? '******' : _balance.toStringAsFixed(2) + ' PHP';
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeInterText(
          text: 'Wallet',
          fontSize: 20,
          fw: FontWeight.bold,
          color: MayaColors.foreground,
        ),
        backgroundColor: const Color(0xFF215A27),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/login');
            },
            icon: Icon(Icons.logout, color: MayaColors.foreground),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200], // Light grey background
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeInterText(text: 'Balance:', fontSize: 20),
                    AutoSizeInterText(
                      text: display,
                      fontSize: 24,
                      fw: FontWeight.bold,
                    ),
                    IconButton(
                      icon: Icon(
                        _hidden ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => setState(() => _hidden = !_hidden),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  debugPrint('Username----> ${widget.username}');
                  context.go(
                    '/send-money',
                    extra: {'username': widget.username},
                  );
                },
                child: const AutoSizeInterText(
                  text: 'Send Money',
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  debugPrint('Username----> ${widget.username}');
                  context.go(
                    '/transactions',
                    extra: {'username': widget.username},
                  );
                },
                child: const AutoSizeInterText(
                  text: 'View Transactions',
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
