import 'package:dartz/dartz.dart';
import '../../domain/entities/number_entity.dart';
import '../../domain/repositories/largest_prime_repository.dart';
import '../../data/datasources/largest_prime_remote_data_source.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';

class LargestPrimeRepositoryImpl implements LargestPrimeRepository {
  final LargestPrimeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LargestPrimeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<NumberEntity>>> getAllEntities() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteEntries = await remoteDataSource.getAllEntities();
        return Right(remoteEntries);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, int>> createEntity(List<int> numbersList) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteEntry = await remoteDataSource.createEntity(numbersList);
        return Right(remoteEntry);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}