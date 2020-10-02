import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/theme/domain/repositories/theme_repository.dart';
import 'package:meta/meta.dart';
import 'package:genius_demo/core/error/failures.dart';

class ApplyTheme {
  final ThemeRepository repository;
  ApplyTheme({@required this.repository});

  Future<Either<Failure, bool>> locally(ThemeType theme) =>
      repository.changeTheme(theme);
}
