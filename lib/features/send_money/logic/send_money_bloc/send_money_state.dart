part of 'send_money_bloc.dart';

sealed class SendMoneyState extends Equatable {
  const SendMoneyState();

  @override
  List<Object> get props => [];
}

final class SendMoneyInitial extends SendMoneyState {}

final class SendMoneyLoading extends SendMoneyState {}

final class SendMoneySuccess extends SendMoneyState {
  final Map<String, dynamic> transaction;

  SendMoneySuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}

final class SendMoneyFailure extends SendMoneyState {
  final String error;

  const SendMoneyFailure({required this.error});

  @override
  List<Object> get props => [error];
}
