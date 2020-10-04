import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/di.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  CustomScaffold({Key key, this.body, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: context.theme.brightness,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.background,
        brightness: context.theme.brightness,
        title: Text(
          title,
          style: StyleText.montSemiBold.copyWith(
            color: context.theme.textColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              context.theme.themeType == ThemeType.dark
                  ? Icons.brightness_high
                  : Icons.bedtime,
              color: context.theme.textColor,
            ),
            onPressed: () {
              sl<ThemeCubit>().switchTheme(
                context.theme.themeType,
              );
            },
          )
        ],
      ),
      body: body,
    );
  }
}
