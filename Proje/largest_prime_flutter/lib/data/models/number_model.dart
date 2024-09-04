import 'package:largest_prime/domain/entities/number_entity.dart';

class NumberModel extends NumberEntity {
  NumberModel({
    required String id,
    required List<int> numbers,
    required int largestPrime,
    required DateTime createdAt,
  }) : super(
    id: id,
    numbersList: numbers,
    largestPrime: largestPrime,
    createdAt: createdAt,
  );

  factory NumberModel.fromJson(Map<String, dynamic> json) {
    return NumberModel(
      id: json['id'],
      numbers: (json['numbersString'] as String)
          .split(',')
          .map(int.parse)
          .toList(),
      largestPrime: json['largestPrime'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}