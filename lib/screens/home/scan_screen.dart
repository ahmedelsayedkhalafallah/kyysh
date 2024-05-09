import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyysh/blocs/scan_qr_bloc/scan_qr_bloc.dart';
import 'package:kyysh/screens/components/my_button.dart';
import 'package:qr_repository/qr_repository.dart';

import '../auth/components/my_text_field.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanQrBloc, ScanQrState>(builder: (context, state) {
      if (state is ScanProcessing) {
        return CircularProgressIndicator();
      } else if (state is AmountPaid) {
        return Text("Amount ${state.qr?.amount ?? 0} paid");
      } else if (state is QRScanned) {
        return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MyTextField(
                        controller: amountController,
                        hintText: 'amount',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(CupertinoIcons.money_dollar),
                        errorMsg: _errorMsg,
                        validator: (val) {})),
                MyButton(
                    fun: () {
                      QR myQr = context.read<QRRepository>().qr;

                      context.read<QRRepository>().qr.CopyWith(
                          userId: myQr.userId,
                          qrId: myQr.qrId,
                          amount: amountController.text,
                          premierPaymentOption: myQr.premierPaymentOption,
                          paymentOptionsSequence: myQr.paymentOptionsSequence,
                          paid: myQr.paid);

                      context
                          .read<ScanQrBloc>()
                          .add(SendAmount(qr: context.read<QRRepository>().qr));
                    },
                    buttonText: "Scanm")
              ],
            ));
      } else {
        return MyButton(
            fun: () {
              context.read<ScanQrBloc>().add(ScanEvent());
            },
            buttonText: "Scan");
      }
    });
  }
}
