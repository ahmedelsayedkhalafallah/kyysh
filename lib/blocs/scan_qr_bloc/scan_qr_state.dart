part of 'scan_qr_bloc.dart';

sealed class ScanQrState extends Equatable {
  const ScanQrState();
  
  @override
  List<Object> get props => [];
}

final class ScanQrInitial extends ScanQrState {}
class ScanProcessing extends ScanQrState {}
class QRScanned extends ScanQrState {
    final QR? qr;

  const QRScanned({required this.qr});
}
class AmountPaid extends ScanQrState {
  final QR? qr;

  const AmountPaid({required this.qr});
}
class ScanQrFailure extends ScanQrState {
  final String? message;

  const ScanQrFailure({required this.message});
}