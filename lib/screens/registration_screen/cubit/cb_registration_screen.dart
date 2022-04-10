import 'st_registration_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';

class CbRegistrationScreen extends Cubit<StRegistrationScreen> {
  CbRegistrationScreen() : super(StRegistrationScreenLoading());
  
  Future<void> getData() async {
    emit(StRegistrationScreenLoaded());
  }
}
    