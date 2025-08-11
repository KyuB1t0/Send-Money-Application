import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_application/data/repositories/repository.dart';
import 'package:send_money_application/features/auth/models/login_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    MayaRepository repository = MayaRepository();
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        final response = await repository.login(event.username, event.password);
        emit(LoginSuccess(loginResponse: response));
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
