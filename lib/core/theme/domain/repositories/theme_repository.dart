import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/error/failures.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeType>> getTheme();
  Future<Either<Failure, bool>> changeTheme(ThemeType theme);
}
