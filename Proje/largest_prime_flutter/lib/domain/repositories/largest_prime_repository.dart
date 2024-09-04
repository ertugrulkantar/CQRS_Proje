import 'package:dartz/dartz.dart';
import '../entities/number_entity.dart';
import '../../core/error/failures.dart';

abstract class LargestPrimeRepository {
  Future<Either<Failure, List<NumberEntity>>> getAllEntities();
  Future<Either<Failure, int>> createEntity(List<int> numbersList);
}