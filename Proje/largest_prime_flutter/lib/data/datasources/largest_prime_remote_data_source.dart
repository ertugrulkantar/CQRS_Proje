import 'package:dio/dio.dart';
import 'dart:convert';
import '../models/number_model.dart';

abstract class LargestPrimeRemoteDataSource {
  Future<List<NumberModel>> getAllEntities();
  Future<int> createEntity(List<int> numbersList);
}

class LargestPrimeRemoteDataSourceImpl implements LargestPrimeRemoteDataSource {
  final Dio dio;
  final String baseUrl = 'http://10.0.2.2:5258';
  LargestPrimeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NumberModel>> getAllEntities() async {
    try {
      final response = await dio.get('$baseUrl/api/LargestPrime');


      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> dataList = jsonResponse['value'] ?? [];

        return dataList
            .map((json) => NumberModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<int> createEntity(List<int> numbersList) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/LargestPrime',
        data: jsonEncode(numbersList),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      final responseData = response.data as Map<String, dynamic>;
      return responseData['value'] as int;
    } catch (e) {
      throw ServerException();
    }
  }
}

class ServerException implements Exception {}