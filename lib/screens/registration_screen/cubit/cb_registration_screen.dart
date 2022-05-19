import 'st_registration_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';

class CbRegistrationScreen extends Cubit<StRegistrationScreen> {
  CbRegistrationScreen() : super(StRegistrationScreenLoaded());
  
  Future<void> getData() async {
    emit(StRegistrationScreenLoaded());
  }
  Future<void> register() async {
    try {
      Map<String, dynamic> response = await Api.post(method: 'auth/sign-up/', body: {
        'email': 'email',
        'username': "ims",
        "password" : 'ssad',
      }, testMode: true);
    } on APIException catch(e) {

    }
  }
}
    