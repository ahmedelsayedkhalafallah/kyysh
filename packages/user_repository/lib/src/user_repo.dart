

import 'package:firebase_auth/firebase_auth.dart';

import 'models/models.dart';

abstract class UserRepository{
  Stream<User?> get user;
  Future <MyUser> signUp(MyUser myUser, String password);
  Future<void> setUserData(MyUser MyUser);
  Future<void> signIn(String email, String password);
    Future<void> signOut();
    MyUser getUser();
    static MyUser myUserObject = MyUser.empty;

}