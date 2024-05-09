//import 'dart:html';


import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable{
  final String userId;
  final String email;
  final String name;

const MyUser({
required this.email,
required this.userId,
required this.name
});


  static const empty = MyUser(
    email: '',
    userId: '',
    name: ''
    );


  MyUser CopyWith({
  final String? userId,
  final String? email,
  final String? name,
  }){
    return MyUser(
    email: email ?? this.email,
    userId: userId ?? this.userId,
    name: name ?? this.name
    );
  }

  UserEntity toEntity(){
    return UserEntity(
    email: email ,
    userId: userId ,
    name: name 
    );
  }

  static MyUser fromEntity(UserEntity userEntiy){
    return MyUser(
    email: userEntiy.email ,
    userId: userEntiy.userId ,
    name: userEntiy.name 
    );
  }
  @override
  List<Object?> get props => [userId, email, name];

}