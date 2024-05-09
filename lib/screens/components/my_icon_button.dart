import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Function()? fun;
  final String buttonText;
  final IconData icon;
  double? size;

  MyIconButton(
      {required this.fun, required this.buttonText, required this.icon, this.size});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.2),
          border: new Border.all(
            color: Colors.white.withOpacity(.5),
            
          ),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: IconButton(
          iconSize: ((size??16.0) - 2.0)*3,
          
          onPressed: fun,
          icon: Icon(icon),
          color: Theme.of(context).colorScheme.primary,
        )),
        Text(
          buttonText,
          style: TextStyle(
              color: Colors.white, fontSize: size??16),
        ),
      ],
    );
  }
}
