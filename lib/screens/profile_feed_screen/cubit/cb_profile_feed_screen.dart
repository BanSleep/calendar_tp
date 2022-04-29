import 'st_profile_feed_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';

class CbProfileFeedScreen extends Cubit<StProfileFeedScreen> {
  CbProfileFeedScreen() : super(StProfileFeedScreenLoaded());
  
  Future<void> getData() async {
    try {
      Map<String, dynamic> response =
          await Api.get(method: 'method', testMode: true);
      emit(StProfileFeedScreenLoaded());
    } on APIException catch (e) {
      emit(StProfileFeedScreenError(error: e.code));
    }
  }
}
    