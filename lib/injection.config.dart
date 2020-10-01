// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/theme/domain/usecases/apply_theme.dart';
import 'core/theme/domain/usecases/get_theme.dart';
import 'core/theme/presentation/bloc/theme_cubit.dart';
import 'core/theme/data/datasources/theme_local_data_source.dart';
import 'core/theme/domain/repositories/theme_repository.dart';
import 'core/theme/data/repositories/theme_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<ThemeLocalDataSource>(() => ThemeLocalDataSourceImpl());
  gh.lazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(localDataSource: get<ThemeLocalDataSource>()));
  gh.lazySingleton<ApplyTheme>(
      () => ApplyTheme(repository: get<ThemeRepository>()));
  gh.lazySingleton<GetTheme>(
      () => GetTheme(repository: get<ThemeRepository>()));
  gh.factory<ThemeCubit>(() =>
      ThemeCubit(changeTheme: get<ApplyTheme>(), fetchTheme: get<GetTheme>()));
  return get;
}
