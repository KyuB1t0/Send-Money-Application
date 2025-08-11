import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:send_money_application/data/api/app_constant/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../router/root_route_name.dart';
import '../states/data_state.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, DataState> {
  SessionBloc() : super(DataInitial()) {
    //AntsRepository antsRepository = AntsRepository();
    on<SessionEvent>((event, emit) {});
    on<SessionUserEvent>((event, emit) async {
      emit(DataLoading());
      try {
        // print("Called");
        // final response =
        //     await antsRepository.login(event.email, event.password);
        // print("State:" + response.toJson().toString());
        emit(const DataSuccess());
      } catch (e) {
        emit(DataError(message: e.toString()));
      }
    });
  }
}
