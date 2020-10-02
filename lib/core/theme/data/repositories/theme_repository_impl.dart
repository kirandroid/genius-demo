import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/error/exceptions.dart';
import 'package:genius_demo/core/error/failures.dart';
import 'package:genius_demo/core/theme/data/datasources/theme_local_data_source.dart';
import 'package:genius_demo/core/theme/domain/repositories/theme_repository.dart';
import 'package:meta/meta.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> changeTheme(ThemeType themeType) async {
    try {
      await localDataSource.changeTheme(themeType);
      return Right(true);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ThemeType>> getTheme() async {
    try {
      final themeType = await localDataSource.getTheme();
      return Right(themeType);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
