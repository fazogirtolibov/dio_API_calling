import 'package:dio_example_n6/data/api/api_service.dart';

class DynamicRepository {
  ApiService apiService;
  DynamicRepository({required this.apiService});

  Future<MyResponse> getDynamic() => apiService.getDynamic();
}
