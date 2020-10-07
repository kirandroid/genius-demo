import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/features/github/presentation/cubit/github_cubit.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  @override
  void initState() {
    BlocProvider.of<GithubCubit>(context).getGitHubRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "GITHUB",
      body: BlocBuilder<GithubCubit, GithubState>(
        builder: (context, state) {
          if (state is GithubInitial) {
            return CircularProgressIndicator();
          } else if (state is GithubLoading) {
            return CircularProgressIndicator();
          } else if (state is GithubLoaded) {
            return ListView.builder(
              itemCount: state.githubRepo.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(state.githubRepo[index].name);
              },
            );
          } else if (state is GithubError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Center(
              child: Text("Some Errors"),
            );
          }
        },
      ),
    );
  }
}
