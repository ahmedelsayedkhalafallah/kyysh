part of 'scan_qr_bloc.dart';

sealed class ScanQrEvent extends Equatable {
  const ScanQrEvent();

  @override
  List<Object> get props => [];
}

class ScanEvent extends ScanQrEvent{
  const ScanEvent();
}

class SendAmount extends ScanQrEvent{
  final QR qr;
  const SendAmount({required this.qr});
}