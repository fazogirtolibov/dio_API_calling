import 'package:dio/dio.dart';
import 'package:dio_example_n6/data/api/api_client.dart';
import 'package:dio_example_n6/data/models/category_model.dart';
import 'package:dio_example_n6/data/models/transaction_model.dart';

class MyResponse {
  String error;
  dynamic data;
  MyResponse({this.data, required this.error});
}

class ApiService extends ApiClient {
  Future<MyResponse> getTransaction() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      print("Response");
      Response response =
          await dio.get("${dio.options.baseUrl}/transactions-expenses");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List?)
                ?.map((e) => TransactionModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getCategories() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      print("Response");
      Response response = await dio.get("${dio.options.baseUrl}/income-types");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
