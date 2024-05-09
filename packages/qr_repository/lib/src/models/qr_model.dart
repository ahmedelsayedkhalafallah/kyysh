import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class QR extends Equatable{
  final String userId;
  final String qrId;
  final String amount;
  final String premierPaymentOption;
  final Map<String,String> paymentOptionsSequence;
  final bool paid;

  const QR({required this.userId, required this.qrId, required this.amount,
  required this.premierPaymentOption, required this.paymentOptionsSequence, required this.paid});

  QR CopyWith({
  required final String userId,
  required final String qrId,
  required final String amount,
  required final String premierPaymentOption,
  required final Map<String,String> paymentOptionsSequence,
  required final bool paid
  }){
    return QR(userId: userId, qrId: qrId, amount: amount,
     premierPaymentOption: premierPaymentOption, 
     paymentOptionsSequence: paymentOptionsSequence,paid: paid);
  }


static const empty = QR(userId: "", qrId: "", amount: "", premierPaymentOption: "", paymentOptionsSequence:{}, paid: false);
  QREntity toEntity(){
    return QREntity(
    userId: userId, qrId: qrId, amount: amount,
     premierPaymentOption: premierPaymentOption, 
     paymentOptionsSequence: paymentOptionsSequence,
     paid: paid
    );
  }

  static QR fromEntity(QREntity qrEntity){
    return QR(userId: qrEntity.userId, qrId: qrEntity.qrId, amount: qrEntity.amount,
     premierPaymentOption: qrEntity.premierPaymentOption, 
     paymentOptionsSequence: qrEntity.paymentOptionsSequence,
     paid: qrEntity.paid);
  }



  @override
  // TODO: implement props
  List<Object?> get props => [userId,qrId,amount,premierPaymentOption,paymentOptionsSequence, paid];

}