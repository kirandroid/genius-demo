import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:genius_demo/features/movies/presentation/widgets/movie_home_list.dart';
import 'package:genius_demo/features/movies/presentation/widgets/movie_home_loading.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/features/movies/presentation/widgets/page_view_item.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _controller = PageController();
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getPopularMovies();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Used to trigger an event when the widget has been built
  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  } // /initializeController()

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "MOVIES",
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesInitial) {
            return MovieHomeLoading();
          } else if (state is MoviesLoading) {
            return MovieHomeLoading();
          } else if (state is MoviesLoaded) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.width - 40,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: _controller,
                    itemBuilder: (_, index) {
                      return PageViewItem(
                          movie: state.nowPlayingMovies.results[index]);
                    },
                  ),
                ),

                // Page indicator
                FutureBuilder(
                  future: initializeController(),
                  builder: (BuildContext context, AsyncSnapshot<void> snap) {
                    if (!snap.hasData) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: PageIndicator(
                          layout: PageIndicatorLayout.SCALE,
                          activeColor: context.theme.corePalatte.colorPrimary,
                          color: Colors.grey,
                          size: 8,
                          controller: _controller,
                          space: 5,
                          count: 4,
                        ),
                      ),
                    );
                  },
                ),

                MovieHomeList(
                  listTitle: "POPULAR MOVIES",
                  moviesResponse: state.popularMovies,
                ),
                MovieHomeList(
                  listTitle: "NOW PLAYING MOVIES",
                  moviesResponse: state.nowPlayingMovies,
                ),
                MovieHomeList(
                  listTitle: "TOP RATED MOVIES",
                  moviesResponse: state.topRatedMovies,
                ),
                MovieHomeList(
                  listTitle: "UPCOMING MOVIES",
                  moviesResponse: state.upcomingMovies,
                ),
              ],
            );
          } else if (state is MoviesError) {
            return MovieHomeLoading();
          } else {
            return MovieHomeLoading();
          }
        },
      ),
    );
  }
}
