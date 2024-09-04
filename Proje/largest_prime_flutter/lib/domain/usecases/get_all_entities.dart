import 'package:dartz/dartz.dart';
import '../entities/number_entity.dart';
import '../repositories/largest_prime_repository.dart';
import '../../core/error/failures.dart';

class GetAllEntities {
  final LargestPrimeRepository repository;

  GetAllEntities(this.repository);

  Future<Either<Failure, List<NumberEntity>>> call() async {
    return await repository.getAllEntities();
  }
}