abstract class StAddGroupScreen{}

class StAddGroupScreenInit extends StAddGroupScreen{}

class StAddGroupScreenLoaded extends StAddGroupScreen{}

class StAddGroupScreenLoading extends StAddGroupScreen{}

class StAddGroupScreenNoAuthError extends StAddGroupScreen{}

class StAddGroupScreenNoInternetError extends StAddGroupScreen {}

class StAddGroupScreenError extends StAddGroupScreen{
  final int? error;
  final String? message;
  StAddGroupScreenError({this.error,this.message});
}
    