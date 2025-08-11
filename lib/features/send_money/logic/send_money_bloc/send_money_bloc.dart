import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_application/data/repositories/repository.dart';

part 'send_money_event.dart';
part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc() : super(SendMoneyInitial()) {
    MayaRepository repository = MayaRepository();
    on<SendMoneyRequested>((event, emit) async {
      emit(SendMoneyLoading());
      try {
        final response = await repository.sendTransaction(
          event.amount,
          event.username, // Assuming 'username' is the correct field to use
        );
        emit(SendMoneySuccess(response));
      } catch (e) {
        emit(SendMoneyFailure(error: e.toString()));
      }
    });
  }
}
