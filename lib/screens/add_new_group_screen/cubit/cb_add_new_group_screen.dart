import 'st_add_new_group_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';

class CbAddNewGroupScreen extends Cubit<StAddNewGroupScreen> {
  CbAddNewGroupScreen() : super(StAddNewGroupScreenLoaded());
  
  Future<void> getData() async {
    try {
      Map<String, dynamic> response =
          await Api.get(method: 'method', testMode: true);
      emit(StAddNewGroupScreenLoaded());
    } on APIException catch (e) {
      emit(StAddNewGroupScreenError(error: e.code));
    }
  }
}
    