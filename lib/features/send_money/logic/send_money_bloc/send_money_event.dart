part of 'send_money_bloc.dart';

sealed class SendMoneyEvent extends Equatable {
  const SendMoneyEvent();

  @override
  List<Object> get props => [];
}

class SendMoneyRequested extends SendMoneyEvent {
  final int amount;
  final String username;

  const SendMoneyRequested({required this.amount, required this.username});
  @override
  List<Object> get props => [amount, username];
}
