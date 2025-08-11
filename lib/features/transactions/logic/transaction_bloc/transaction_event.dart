part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class FetchTransactions extends TransactionEvent {
  final String username;
  const FetchTransactions({required this.username});

  @override
  List<Object> get props => [username];
}
