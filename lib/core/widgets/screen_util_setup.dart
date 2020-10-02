import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilSetup extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  const ScreenUtilSetup({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: Builder(
        builder: (BuildContext context) {
          ScreenUtil.init(
            context,
            width: 375,
            height: 812,
            allowFontScaling: true,
          );
          return builder?.call(context);
        },
      ),
    );
  }
}
