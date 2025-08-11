import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money_application/core/theme/od_colors.dart';
import 'package:send_money_application/features/transactions/logic/transaction_bloc/transaction_bloc.dart';
import 'package:send_money_application/widgets/auto_size_intertext.dart';

class TransactionsScreen extends StatefulWidget {
  final String username;
  TransactionsScreen({super.key, required this.username});

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              TransactionBloc()
                ..add(FetchTransactions(username: widget.username)),
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
            text: 'Transactions',
            fontSize: 20,
            fw: FontWeight.bold,
            color: MayaColors.foreground,
          ),
          backgroundColor: const Color(0xFF215A27),
        ),
        body: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionFailure) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is TransactionSuccess) {
              return ListView.separated(
                itemCount: state.transactions.length,
                separatorBuilder:
                    (context, index) => const Divider(color: Colors.grey),
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  final item = state.transactions[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: MayaColors.primary,
                        child: const Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Transaction ID: ${item['id']}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Text(
                        '₱${item['amount']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No transactions.'));
            }
          },
        ),
      ),
    );
  }
}
