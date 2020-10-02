import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleExtension on num {
  double get adaptiveHeight => ScreenUtil().setHeight(this) as double;
  double get adaptiveWidth => ScreenUtil().setWidth(this) as double;
  double get adaptiveFont => ScreenUtil().setSp(this) as double;

  /// Extension for number which will produce horizontal margin using SizedBox
  SizedBox get horizontalSpace => SizedBox(width: adaptiveWidth);

  /// Extension for number which will produce vertical margin using SizedBox
  SizedBox get verticalSpace => SizedBox(height: adaptiveHeight);
}
