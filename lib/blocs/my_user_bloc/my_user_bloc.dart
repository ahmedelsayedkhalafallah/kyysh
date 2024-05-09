import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository _userRepository;
  MyUserBloc(UserRepository userRepository) :
  _userRepository = userRepository, super(MyUserInitial()) {
    on<GetMyUserEvent>((event, emit) async {
      emit(MyUserLoading());
      try {
        MyUser myUser = await userRepository.getUser();
      emit(MyUserSuccess(myUser: myUser));
      } catch (e) {
        emit(MyUserFailure(message: e.toString()));
        log(e.toString());
        rethrow;
      }
    });
  }
}

