import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money_application/core/theme/od_colors.dart';
import 'package:send_money_application/data/repositories/repository.dart';
import 'package:send_money_application/features/send_money/logic/send_money_bloc/send_money_bloc.dart';
import 'package:send_money_application/widgets/auto_size_intertext.dart';

class SendMoneyScreen extends StatefulWidget {
  final String username;
  const SendMoneyScreen({super.key, required this.username});

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  MayaRepository mayaRepository = MayaRepository();
  final _controller = TextEditingController();

  void _showBottomSheet({required bool success, required String message}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          height: 180,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  success ? Icons.check_circle : Icons.error,
                  size: 48,
                  color: success ? Colors.green : Colors.red,
                ),
                const SizedBox(height: 8),
                Text(message),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendMoneyBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MayaColors.foreground),
            onPressed: () {
              context.go('/wallet', extra: {'username': widget.username});
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.go('/login');
              },
              icon: Icon(Icons.logout, color: MayaColors.foreground),
            ),
          ],
          title: AutoSizeInterText(
            text: 'Send Money',
            fontSize: 20,
            fw: FontWeight.bold,
            color: MayaColors.foreground,
          ),
          backgroundColor: const Color(0xFF215A27),
        ),
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AutoSizeInterText(
                  text: 'Enter Amount to Send',
                  fontSize: 20,
                  fw: FontWeight.bold,
                  align: TextAlign.start,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Enter amount to send',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                BlocConsumer<SendMoneyBloc, SendMoneyState>(
                  listener: (context, state) {
                    if (state is SendMoneySuccess) {
                      _showBottomSheet(
                        success: true,
                        message:
                            'Amount sent successfully: ₱${state.transaction['amount']}',
                      );
                      _controller.clear();
                    } else if (state is SendMoneyFailure) {
                      _showBottomSheet(success: false, message: state.error);
                    }
                  },
                  builder: (context, state) {
                    return state is SendMoneyLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF215A27),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final raw = _controller.text.trim();
                            if (raw.isEmpty) {
                              _showBottomSheet(
                                success: false,
                                message: 'Please enter amount',
                              );
                              return;
                            }
                            final amount = int.tryParse(raw);
                            if (amount == null) {
                              _showBottomSheet(
                                success: false,
                                message: 'Invalid number',
                              );
                              return;
                            }
                            context.read<SendMoneyBloc>().add(
                              SendMoneyRequested(
                                amount: amount,
                                username: widget.username,
                              ),
                            );
                          },
                          child: AutoSizeInterText(
                            text: 'Send Money',
                            color: MayaColors.foreground,
                            fontSize: 18,
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
