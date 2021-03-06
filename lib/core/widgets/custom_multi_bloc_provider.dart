import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/di.dart';
import 'package:genius_demo/features/github/presentation/cubit/github_cubit.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movie/movies_cubit.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movie_video/movie_video_cubit.dart';
import 'package:genius_demo/features/news/presentation/cubit/news_cubit.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  final Widget child;

  const CustomMultiBlocProvider({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ThemeCubit>(
          create: (_) => sl<ThemeCubit>(),
        ),
        BlocProvider<NewsCubit>(
          create: (_) => sl<NewsCubit>(),
        ),
        BlocProvider<MoviesCubit>(
          create: (_) => sl<MoviesCubit>(),
        ),
        BlocProvider<GithubCubit>(
          create: (_) => sl<GithubCubit>(),
        ),
        BlocProvider<MovieVideoCubit>(
          create: (_) => sl<MovieVideoCubit>(),
        ),
      ],
      child: child ?? SizedBox(),
    );
  }
}
