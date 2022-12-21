import 'package:dio_example_n6/data/api/api_service.dart';

class CategoryRepository {
  ApiService apiService;
  CategoryRepository({required this.apiService});

  Future<MyResponse> getCategories() => apiService.getCategories();
}
