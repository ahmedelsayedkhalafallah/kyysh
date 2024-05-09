import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyysh/app.dart';
import 'package:kyysh/firebase_options.dart';
import 'package:user_repository/user_repository.dart';
import 'package:kyysh/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //name: "kyysh",
    options: DefaultFirebaseOptions.currentPlatform,
);
Bloc.observer = MyBlocObserver();
  runApp( MyApp(FirebaseUserRepo()));
  
}


