part of 'github_cubit.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object> get props => [];
}

class GithubInitial extends GithubState {}

class GithubLoading extends GithubState {}

class GithubEmpty extends GithubState {}

class GithubError extends GithubState {
  final String errorMessage;
  GithubError({@required this.errorMessage});
}

class GithubLoaded extends GithubState {
  final List<GitHubResponse> githubRepo;
  GithubLoaded({
    @required this.githubRepo,
  });
}
