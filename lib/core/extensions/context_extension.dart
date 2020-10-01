import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_palatte.dart';
import 'package:genius_demo/core/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

extension ContextExtension on BuildContext {
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast().showToast(message: 'Could not launch $url', context: this);
    }
  }

  ThemePalatte get theme => bloc<ThemeCubit>().state;
}
