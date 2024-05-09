part of 'my_user_bloc.dart';

sealed class MyUserState extends Equatable {
  const MyUserState();
  
  @override
  List<Object> get props => [];
}

final class MyUserInitial extends MyUserState {}
final class MyUserSuccess extends MyUserState {
  final MyUser myUser;
  const MyUserSuccess({required this.myUser});
}
final class MyUserLoading extends MyUserState {}
final class MyUserFailure extends MyUserState {
  final String message;
  const MyUserFailure({required this.message});
}

