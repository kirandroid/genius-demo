import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
            value: context.theme.themeType == ThemeType.dark,
            onChanged: (bool status) {
              BlocProvider.of<ThemeCubit>(context).switchTheme(
                context.theme.themeType,
              );
            }),
      ),
    );
  }
}
