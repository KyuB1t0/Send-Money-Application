import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_application/data/repositories/repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    MayaRepository repository = MayaRepository();
    on<FetchTransactions>((event, emit) async {
      emit(TransactionLoading());
      try {
        final transactions = await repository.getTransactions(event.username);
        // filter by username
        final filtered =
            transactions.where((t) => t['username'] == event.username).toList();
        emit(TransactionSuccess(filtered));
      } catch (e) {
        emit(TransactionFailure(error: e.toString()));
      }
    });
  }
}
