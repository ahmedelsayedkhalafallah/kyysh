import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_repository/qr_repository.dart';

part 'scan_qr_event.dart';
part 'scan_qr_state.dart';

class ScanQrBloc extends Bloc<ScanQrEvent, ScanQrState> {
  QRRepository qrRepository;
  ScanQrBloc(QRRepository qrRepository) :
  qrRepository= qrRepository, super(ScanQrInitial()) {
    on<ScanEvent>((event, emit) async{
      emit(ScanProcessing());
      try {
       QR qr = await qrRepository.scanQr();
       emit(QRScanned(qr: qr));
      } catch (e) {
        emit(ScanQrFailure(message: e.toString()));
      }
    });


    on<SendAmount>((event, emit) async {
      await qrRepository.sendAmount(event.qr);
  });
  }

  
}
 