import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _streamSubscription; 
  AuthenticationBloc({required this.userRepository}) :
   super(const AuthenticationState.unknown()) {
    _streamSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user: user));
    });
  
    on<AuthenticationUserChanged>((event, emit) {
      if(event.user != null){
        emit(AuthenticationState.authenticated(event.user!));
      }else{
        emit(AuthenticationState.unauthenticated());

      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel(); 
    return super.close();
  }
}
