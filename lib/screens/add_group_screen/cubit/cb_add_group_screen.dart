import 'st_add_group_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';

class CbAddGroupScreen extends Cubit<StAddGroupScreen> {
  CbAddGroupScreen() : super(StAddGroupScreenLoaded());
  
  Future<void> getData() async {
    emit(StAddGroupScreenLoaded());
    try {
      // Map<String, dynamic> response =
      //     await Api.get(method: 'method', testMode: true);

    } on APIException catch (e) {
      emit(StAddGroupScreenError(error: e.code));
    }
  }
}
    