import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:qr_repository/src/entities/entities.dart';
import 'package:qr_repository/src/models/qr_model.dart';
import 'package:qr_repository/src/qr_repo.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';



class FirebaseQRRepository implements QRRepository{
  
  final qrsCollection = FirebaseFirestore.instance.collection('qrs');
  final userCollection = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> saveQRData(QR qr) async {
  try {

    Map<String,dynamic> data = {};
    
    Map<String, QR> userQrs = await getUserQrs(qr.userId);
    userQrs.putIfAbsent(qr.qrId, () => qr);

    userQrs.forEach((key, value) {
      data.putIfAbsent(key, () => qr.toEntity().toDocument());
    });

    await qrsCollection.doc(qr.userId).set(data);
    
  } catch (e) {
    log(e.toString());
    rethrow;
  }
  }



  @override
  Future<QR?> getQrData(String userId, String qrId) async {
    try {
      Map<String, QR> userQrs = await getUserQrs(userId);
      return userQrs[qrId];
    } catch (e) {
      log(e.toString());
    rethrow;
    }
  }

  

  @override
  Future<QR> scanQr() async {
    
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#${CupertinoColors.activeBlue.value.toRadixString(16)}', 
      "canceeel", true,ScanMode.QR );
      
      return QR.fromEntity(QREntity.fromDocument(jsonDecode(barcodeScanRes)));
  }



    @override
  QrImageView generateQrImage(QR qr) {
    return QrImageView(
  data: jsonEncode(qr.toEntity().toDocument()),
  version: QrVersions.auto,
  size: 200.0,
);
  }

   getUserQrs(String userId) async {
    Map<String, QR> qrs = {};
    DocumentSnapshot documentSnapshot = await userCollection.doc(userId).get();

    if(documentSnapshot.exists){
      Map data = documentSnapshot.data() as Map;
      data.forEach((key, value) {
        qrs[key] = QR.fromEntity(QREntity.fromDocument(value));
      });
      return qrs;
    }else{
      return {};
    }
  }
  
  @override
  Future<void> sendAmount( QR qr) async {
    
     try {
       await FirebaseFirestore.instance.collection('qrs').doc(qr.userId).update({qr.qrId: qr.toEntity().toDocument()});
       
     } catch (e) {
       log(e.toString());
    rethrow;
     }
  }
  
  @override
  QR qr = QR.empty;
  


}