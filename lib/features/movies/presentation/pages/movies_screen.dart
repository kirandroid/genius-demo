import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movies_cubit.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "MOVIES",
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesInitial) {
                    return CircularProgressIndicator();
                  } else if (state is MoviesLoading) {
                    return CircularProgressIndicator();
                  } else if (state is MoviesLoaded) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.moviesResponse.results.length,
                        itemBuilder: (context, index) {
                          final movie = state.moviesResponse.results[index];
                          return Text(movie.title);
                        });
                  } else if (state is MoviesError) {
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
            ),
          ),
        ],
      ),
    );
  }
}
