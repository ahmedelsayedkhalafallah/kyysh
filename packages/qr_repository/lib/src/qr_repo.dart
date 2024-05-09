import 'dart:async';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_repository/src/models/models.dart';

abstract class QRRepository {
  QR qr = QR.empty;
  Future<QR?> getQrData(String userId, String qrId);
  Future<void> saveQRData(QR qr);
  Future<QR> scanQr();
  QrImageView generateQrImage(QR qr);
  Future getUserQrs(String userId);
  Future<void> sendAmount( QR qr);
}