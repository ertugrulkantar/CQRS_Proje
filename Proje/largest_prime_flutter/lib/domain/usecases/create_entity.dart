import 'package:dartz/dartz.dart';
import '../repositories/largest_prime_repository.dart';
import '../../core/error/failures.dart';

class CreateEntity {
  final LargestPrimeRepository repository;

  CreateEntity(this.repository);

  Future<Either<Failure, int>> call(List<int> numbersList) async {
    return await repository.createEntity(numbersList);
  }
}