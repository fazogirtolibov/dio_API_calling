import 'package:dio_example_n6/data/api/api_service.dart';
import 'package:dio_example_n6/data/repository/dynamic_repository.dart';
import 'package:dio_example_n6/data/repository/transaction_repository.dart';
import 'package:dio_example_n6/ui/app_router.dart';
import 'package:dio_example_n6/ui/category_page.dart';
import 'package:dio_example_n6/ui/transaction_page.dart';
import 'package:dio_example_n6/ui/web_page.dart';
import 'package:dio_example_n6/view_model/category_view_model.dart';
import 'package:dio_example_n6/view_model/dynamic_view_model.dart';
import 'package:dio_example_n6/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repository/category_repository.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DynamicViewModel(
            dynamicRepository: DynamicRepository(apiService: ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionViewModel(
            transferRepository: TransactionRepository(apiService: ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(
            categoryRepository: CategoryRepository(apiService: ApiService()),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteName.category,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
