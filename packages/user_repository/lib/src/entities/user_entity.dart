import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String userId;
  final String email;
  final String name;

  const UserEntity({
required this.email,
required this.userId,
required this.name
});

Map<String, Object?> toDocument(){
  return {
    "userId" : userId,
    "email" : email,
    "name" : name
  };
}

static UserEntity fromDocument(Map<String, dynamic>? document){
  return UserEntity(
    email: document?['email'],
    userId: document?['userId'],
    name: document?['name']
    );

}

  @override
  List<Object?> get props => [userId, email, name];
}