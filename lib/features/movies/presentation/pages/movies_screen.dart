import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movie/movies_cubit.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movie_video/movie_video_cubit.dart';
import 'package:genius_demo/features/movies/presentation/widgets/movie_home_list.dart';
import 'package:genius_demo/features/movies/presentation/widgets/movie_home_loading.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/features/movies/presentation/widgets/page_view_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _controller = PageController();

  YoutubePlayerController _youtubeController;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  void listener() {
    if (_isPlayerReady && mounted && !_youtubeController.value.isFullScreen) {
      setState(() {
        _playerState = _youtubeController.value.playerState;
        _videoMetaData = _youtubeController.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _youtubeController.pause();
    super.deactivate();
  }

  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).getPopularMovies();
    super.initState();
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    _idController.dispose();
    _seekToController.dispose();
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
        body: BlocListener<MovieVideoCubit, MovieVideoState>(
          listener: (context, state) {
            if (state is MovieVideoLoaded) {
              print("Loaded state");
              _youtubeController = YoutubePlayerController(
                initialVideoId: state.movieVideos.results[0].key,
                flags: YoutubePlayerFlags(
                  mute: false,
                  autoPlay: false,
                  disableDragSeek: false,
                  loop: false,
                  isLive: false,
                ),
              )..addListener(listener);
              _idController = TextEditingController();
              _seekToController = TextEditingController();
              _videoMetaData = YoutubeMetaData();
              _playerState = PlayerState.unknown;
              showDialog<void>(
                context: context,
                barrierDismissible: true, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(0),
                    content: SingleChildScrollView(
                        child: Container(
                      child: YoutubePlayer(
                        controller: _youtubeController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                        onReady: () {
                          _controller.addListener(listener);
                        },
                      ),
                    )),
                  );
                },
              );
            } else if (state is MovieVideoLoading) {
              print("Loading State");
            } else if (state is MovieVideoInitial) {
              print("Movie Initial");
            } else {
              print("Some State!");
            }
          },
          child: BlocBuilder<MoviesCubit, MoviesState>(
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
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snap) {
                        if (!snap.hasData) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: PageIndicator(
                              layout: PageIndicatorLayout.SCALE,
                              activeColor:
                                  context.theme.corePalatte.colorPrimary,
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
        ));
  }
}
