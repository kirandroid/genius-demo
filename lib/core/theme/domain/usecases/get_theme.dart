import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/theme/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton()
class GetTheme {
  final ThemeRepository repository;
  GetTheme({@required this.repository});
  Future<Either<Failure, ThemeType>> fromLocal() => repository.getTheme();
}
