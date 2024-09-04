import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';

import 'core/network/network_info.dart';
import 'data/datasources/largest_prime_remote_data_source.dart';
import 'domain/repositories/largest_prime_repository_impl.dart';
import 'domain/repositories/largest_prime_repository.dart';
import 'domain/usecases/get_all_entities.dart';
import 'domain/usecases/create_entity.dart';
import 'presentation/bloc/largest_prime_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Largest Prime
  // Bloc
  sl.registerFactory(
        () => LargestPrimeBloc(
      getAllEntities: sl(),
      createEntity: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllEntities(sl()));
  sl.registerLazySingleton(() => CreateEntity(sl()));

  // Repository
  sl.registerLazySingleton<LargestPrimeRepository>(
        () => LargestPrimeRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LargestPrimeRemoteDataSource>(
        () => LargestPrimeRemoteDataSourceImpl(dio: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}