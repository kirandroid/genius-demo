import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/hive/hive_setup.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/theme/presentation/widgets/theme_builder.dart';
import 'package:genius_demo/core/widgets/events_mo_multi_bloc_provider.dart';
import 'package:genius_demo/core/widgets/screen_util_setup.dart';
import 'package:genius_demo/features/index_screen.dart';
import 'package:genius_demo/injection.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await HiveSetup.initHive;
  await getIt<ThemeCubit>().fetchTheme();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventsMoMultiBlocProvider(
      child: ScreenUtilSetup(
        builder: (context) {
          return ThemeBuilder(
            builder: (context, palatte) {
              return MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: palatte.background,
                ),
                debugShowCheckedModeBanner: false,
                home: IndexScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
