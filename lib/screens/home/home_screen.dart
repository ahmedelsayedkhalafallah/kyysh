import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyysh/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:kyysh/blocs/scan_qr_bloc/scan_qr_bloc.dart';
import 'package:kyysh/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:kyysh/screens/components/my_icon_button.dart';
import 'package:kyysh/screens/home/scan_screen.dart';
import 'package:qr_repository/qr_repository.dart';
import 'package:user_repository/user_repository.dart';

class HomeScreen extends StatefulWidget {
  final MyUser myUser;
  const HomeScreen({super.key, required this.myUser});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF19173D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 72.0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyIconButton(
                    fun: () {},
                    buttonText: "",
                    icon: Icons.person,
                    size: 12.0,
                  ),
                  Column(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      Text(
                        widget.myUser.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ],
                  )
                ],
              ),
              MyIconButton(
                fun: () {
                  context.read<SignInBloc>().add(SignOutEvent());
                },
                buttonText: "Log out",
                icon: Icons.login,
                size: 12.0,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  BlocProvider<ScanQrBloc>(
                    create: (context) => ScanQrBloc(FirebaseQRRepository()),
                    child: ScanScreen(),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
