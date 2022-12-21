import 'package:dio_example_n6/data/api/api_service.dart';
import 'package:dio_example_n6/data/models/transaction_model.dart';
import 'package:dio_example_n6/data/repository/transaction_repository.dart';
import 'package:flutter/cupertino.dart';

class TransactionViewModel extends ChangeNotifier {
  TransactionRepository transferRepository;
  TransactionViewModel({required this.transferRepository}) {
    fetchTransaction();
  }

  List<TransactionModel>? transactionModels;
  String errorForUI = "";

  fetchTransaction() async {
    MyResponse myResponse = await transferRepository.getTransaction();
    if (myResponse.error.isEmpty) {
      transactionModels = myResponse.data as List<TransactionModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }
}
