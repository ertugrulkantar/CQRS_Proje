import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_all_entities.dart';
import '../../domain/usecases/create_entity.dart';
import '../../domain/entities/number_entity.dart';
import '../../core/error/failures.dart';

// Events
abstract class LargestPrimeEvent {}

class GetAllEntitiesEvent extends LargestPrimeEvent {}

class CreateEntityEvent extends LargestPrimeEvent {
  final List<int> numbersList;
  CreateEntityEvent(this.numbersList);
}

// States
abstract class LargestPrimeState {}

class LargestPrimeInitial extends LargestPrimeState {}

class LargestPrimeLoading extends LargestPrimeState {}

class EntitiesLoaded extends LargestPrimeState {
  final List<NumberEntity> entities;
  EntitiesLoaded(this.entities);
}

class EntityCreated extends LargestPrimeState {
  final int entity;
  EntityCreated(this.entity);
}

class LargestPrimeError extends LargestPrimeState {
  final String message;
  LargestPrimeError(this.message);
}

// BLoC
class LargestPrimeBloc extends Bloc<LargestPrimeEvent, LargestPrimeState> {
  final GetAllEntities getAllEntities;
  final CreateEntity createEntity;

  LargestPrimeBloc({
    required this.getAllEntities,
    required this.createEntity,
  }) : super(LargestPrimeInitial()) {
    on<GetAllEntitiesEvent>(_onGetAllEntities);
    on<CreateEntityEvent>(_onCreateEntity);
  }

  Future<void> _onGetAllEntities(GetAllEntitiesEvent event, Emitter<LargestPrimeState> emit) async {
    emit(LargestPrimeLoading());
    final result = await getAllEntities();
    result.fold(
          (failure) => emit(LargestPrimeError(_mapFailureToMessage(failure))),
          (entries) => emit(EntitiesLoaded(entries)),
    );
  }

  Future<void> _onCreateEntity(CreateEntityEvent event, Emitter<LargestPrimeState> emit) async {
    emit(LargestPrimeLoading());
    final result = await createEntity(event.numbersList);
    result.fold(
          (failure) => emit(LargestPrimeError(_mapFailureToMessage(failure))),
          (entry) => emit(EntityCreated(entry)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure';
      case NetworkFailure:
        return 'Network failure';
      default:
        return 'Unexpected error';
    }
  }
}