import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/di.dart';
import 'package:genius_demo/features/movies/presentation/cubit/movies_cubit.dart';
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
      ],
      child: child ?? SizedBox(),
    );
  }
}
