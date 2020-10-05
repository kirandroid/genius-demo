import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/di.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  CustomScaffold({Key key, this.body, this.title}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: context.theme.brightness,
      ),
    );

    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        bool connected = connectivity != ConnectivityResult.none;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Stack(
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor:
                      connected ? context.theme.background : Colors.red,
                  brightness:
                      connected ? context.theme.brightness : Brightness.dark,
                  title: Text(
                    widget.title,
                    style: StyleText.montSemiBold.copyWith(
                      color: connected ? context.theme.textColor : Colors.white,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        context.theme.themeType == ThemeType.dark
                            ? Icons.brightness_high
                            : Icons.bedtime,
                        color:
                            connected ? context.theme.textColor : Colors.white,
                      ),
                      onPressed: () {
                        sl<ThemeCubit>().switchTheme(
                          context.theme.themeType,
                        );
                      },
                    )
                  ],
                ),
                connected
                    ? const SizedBox()
                    : Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 12.0,
                                height: 12.0,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                "OFFLINE",
                                style: StyleText.montMedium
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
          body: widget.body,
        );
      },
      child: const SizedBox(),
    );
  }
}
