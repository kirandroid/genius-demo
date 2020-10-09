// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:genius_demo/features/movies/presentation/cubit/movie/movies_cubit.dart';
// import 'package:genius_demo/features/movies/presentation/cubit/movie_video/movie_video_cubit.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class MovieVideoPage extends StatefulWidget {
//   final String movie_id;

//   const MovieVideoPage({Key key, this.movie_id}) : super(key: key);
//   @override
//   _MovieVideoPageState createState() => _MovieVideoPageState();
// }

// class _MovieVideoPageState extends State<MovieVideoPage> {
//   YoutubePlayerController _controller;
//   TextEditingController _idController;
//   TextEditingController _seekToController;

//   PlayerState _playerState;
//   YoutubeMetaData _videoMetaData;
//   bool _isPlayerReady = false;

//   int count = 0;

//   @override
//   void initState() {
//     BlocProvider.of<MovieVideoCubit>(context)
//         .getMovieVideos(movie_id: widget.movie_id);
//     super.initState();
//   }

//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }

//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     _controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _idController.dispose();
//     _seekToController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: BlocConsumer<MovieVideoCubit, MovieVideoState>(
//           listener: (context, state) {
//             if (state is MovieVideoLoaded) {
//               _controller = YoutubePlayerController(
//                 initialVideoId: state.movieVideos.results[0].key,
//                 flags: YoutubePlayerFlags(
//                   mute: false,
//                   autoPlay: false,
//                   disableDragSeek: false,
//                   loop: false,
//                   isLive: false,
//                 ),
//               )..addListener(listener);
//               _idController = TextEditingController();
//               _seekToController = TextEditingController();
//               _videoMetaData = YoutubeMetaData();
//               _playerState = PlayerState.unknown;
//             }
//           },
//           builder: (context, state) {
//             if (state is MovieVideoLoading) {
//               return CircularProgressIndicator();
//             } else if (state is MovieVideoError) {
//               return Text(state.errorMessage);
//             } else if (state is MovieVideoLoaded) {
//               return YoutubePlayer(
//                 controller: _controller,
//                 showVideoProgressIndicator: true,
//                 progressIndicatorColor: Colors.amber,
//                 progressColors: ProgressBarColors(
//                   playedColor: Colors.amber,
//                   handleColor: Colors.amberAccent,
//                 ),
//                 onReady: () {
//                   _controller.addListener(listener);
//                 },
//               );
//             } else {
//               return Text("YOLO");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
