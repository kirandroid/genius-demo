import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/features/github/domain/entities/github_response.dart';
import 'package:genius_demo/features/github/domain/usecases/get_user_repo.dart';

part 'github_state.dart';

class GithubCubit extends Cubit<GithubState> {
  GetUserRepo getUserRepo;
  GithubCubit({@required this.getUserRepo}) : super(GithubInitial());

  Future<void> getGitHubRepo() async {
    emit(GithubLoading());
    final failureOrLocalRepo = await getUserRepo.getRepoFromLocal();
    failureOrLocalRepo.fold(
      (failure) => emit(
        GithubError(errorMessage: "Some Error"),
      ),
      (repo) => emit(
        GithubLoaded(githubRepo: repo),
      ),
    );

    final failureOrRemoteRepo = await getUserRepo.getRepoFromRemote();
    failureOrRemoteRepo.fold(
      (failure) => emit(
        GithubError(errorMessage: "Some Error"),
      ),
      (repo) => emit(
        GithubLoaded(githubRepo: repo),
      ),
    );
  }
}
