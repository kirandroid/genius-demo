import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:genius_demo/core/theme/data/datasources/theme_local_data_source.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/core/utils/network_info.dart';
import 'package:genius_demo/features/news/data/datasources/news_local_data_source.dart';
import 'package:genius_demo/features/news/data/datasources/news_remote_data_source.dart';
import 'package:genius_demo/features/news/data/repositories/news_repository_impl.dart';
import 'package:genius_demo/features/news/domain/repositories/news_repository.dart';
import 'package:genius_demo/features/news/domain/usecases/get_news.dart';
import 'package:genius_demo/features/news/presentation/cubit/news_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'core/theme/data/repositories/theme_repository_impl.dart';
import 'core/theme/domain/repositories/theme_repository.dart';
import 'core/theme/domain/usecases/apply_theme.dart';
import 'core/theme/domain/usecases/get_theme.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI() async {
  _themeRegistration();
  _newsRegistration();
  _externalRegistration();
}

// Theme registration
void _themeRegistration() {
  // Theme bloc
  sl.registerLazySingleton(
    () => ThemeCubit(
      changeTheme: sl(),
      fetchTheme: sl(),
    ),
  );

  // Apply use case
  sl.registerLazySingleton(() => ApplyTheme(repository: sl()));
  sl.registerLazySingleton(() => GetTheme(repository: sl()));

  // Repository
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data source
  sl.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImpl());
}

void _newsRegistration() {
  sl.registerFactory(() => NewsCubit(getNews: sl()));
  sl.registerLazySingleton(() => GetNews(repository: sl()));
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl());
}

_externalRegistration() async {
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Hive);
}
