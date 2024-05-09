import 'package:equatable/equatable.dart';

class QREntity extends Equatable{
  final String userId;
  final String qrId;
  final String amount;
  final String premierPaymentOption;
  final Map<String,String> paymentOptionsSequence;
  final bool paid;

  const QREntity({required this.userId, required this.qrId, required this.amount,
  required this.premierPaymentOption, required this.paymentOptionsSequence,
  required this.paid});

  Map<String, Object> toDocument(){
    return {
      'userId' : userId,
      'qrId' : qrId,
      'amount' : amount,
      'premierPaymentOption' : premierPaymentOption,
      'paymentOptionsSequence' : paymentOptionsSequence,
      'paid': paid
    };
  }

  static QREntity fromDocument(Map<String, dynamic> document){
    return QREntity(userId: document["userId"], qrId: document["qrId"], amount: document["amount"],
     premierPaymentOption: document["premierPaymentOption"],
      paymentOptionsSequence: document["paymentOptionsSequence"], paid: document["paid"]);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [userId,qrId,amount,premierPaymentOption,paymentOptionsSequence, paid];
}