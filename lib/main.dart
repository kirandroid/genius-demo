import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/core/routes/router.gr.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/theme/presentation/widgets/theme_builder.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/widgets/custom_multi_bloc_provider.dart';
import 'package:genius_demo/core/widgets/screen_util_setup.dart';
import 'package:genius_demo/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  await initDI();
  await HiveSetup.initHive;
  await sl<ThemeCubit>().fetchTheme();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: ScreenUtilSetup(
        builder: (context) {
          return ThemeBuilder(
            builder: (context, palatte) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: ExtendedNavigator.builder(
                    router: CustomRouter(),
                    initialRoute: '/',
                    builder: (ctx, extendedNav) => Theme(
                          data: ThemeData(
                            scaffoldBackgroundColor: palatte.background,
                            brightness: palatte.brightness,
                            primaryColor: palatte.corePalatte.colorPrimary,
                            primaryColorDark:
                                palatte.corePalatte.colorPrimaryDark,
                            primaryColorLight:
                                palatte.corePalatte.colorPrimaryLight,
                            bottomNavigationBarTheme:
                                BottomNavigationBarThemeData(
                              backgroundColor: palatte.surface,
                              selectedIconTheme: IconThemeData(
                                size: 20,
                              ),
                              unselectedIconTheme: IconThemeData(
                                color: Colors.grey,
                                size: 20,
                              ),
                              selectedLabelStyle: StyleText.montMedium.copyWith(
                                fontSize: 12,
                              ),
                              unselectedLabelStyle:
                                  StyleText.montMedium.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          child: extendedNav,
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
