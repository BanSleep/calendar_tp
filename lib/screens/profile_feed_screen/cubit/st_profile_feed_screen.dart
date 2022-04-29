abstract class StProfileFeedScreen{}

class StProfileFeedScreenInit extends StProfileFeedScreen{}

class StProfileFeedScreenLoaded extends StProfileFeedScreen{}

class StProfileFeedScreenLoading extends StProfileFeedScreen{}

class StProfileFeedScreenNoAuthError extends StProfileFeedScreen{}

class StProfileFeedScreenNoInternetError extends StProfileFeedScreen {}

class StProfileFeedScreenError extends StProfileFeedScreen{
  final int? error;
  final String? message;
  StProfileFeedScreenError({this.error,this.message});
}
    