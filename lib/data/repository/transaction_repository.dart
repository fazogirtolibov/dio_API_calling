import 'package:dio_example_n6/data/api/api_service.dart';

class TransactionRepository {
  ApiService apiService;
  TransactionRepository({required this.apiService});

  getTransaction() => apiService.getTransaction();
}
