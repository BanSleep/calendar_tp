abstract class StAddNewGroupScreen{}

class StAddNewGroupScreenInit extends StAddNewGroupScreen{}

class StAddNewGroupScreenLoaded extends StAddNewGroupScreen{}

class StAddNewGroupScreenLoading extends StAddNewGroupScreen{}

class StAddNewGroupScreenNoAuthError extends StAddNewGroupScreen{}

class StAddNewGroupScreenNoInternetError extends StAddNewGroupScreen {}

class StAddNewGroupScreenError extends StAddNewGroupScreen{
  final int? error;
  final String? message;
  StAddNewGroupScreenError({this.error,this.message});
}
    