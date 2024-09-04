class NumberEntity {
  final String id;
  final List<int> numbersList;
  final int largestPrime;
  final DateTime createdAt;

  NumberEntity({
    required this.id,
    required this.numbersList,
    required this.largestPrime,
    required this.createdAt,
  });
}