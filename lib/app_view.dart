import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyysh/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:kyysh/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:kyysh/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:kyysh/screens/auth/welcome_screen.dart';
import 'package:kyysh/screens/home/home_screen.dart';
import 'package:user_repository/user_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    MyUser myUser = MyUser.empty;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color(0xFF0E39C6),
            onPrimary: Colors.black,
            secondary: Color(0xFF0DA6C2),
            onSecondary: Colors.white,
            tertiary: Color(0xFFFF8D6C),
            error: Colors.red,
            outline: Color(0xFF424242)),
      ),
      title: 'Kyysh',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider<SignInBloc>(
            create: (context) {
              return SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository);
            },
            child: BlocProvider<MyUserBloc>(
              create: (context) {
                return MyUserBloc(
                    context.read<AuthenticationBloc>().userRepository);
              },
              child: BlocBuilder<MyUserBloc, MyUserState>(
                  builder: (context, state) {
                if (state is MyUserSuccess) {
                  return HomeScreen(myUser: state.myUser);
                } else {
                  return WelcomeScreen();
                }
              }),
            ),
          );
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}
