import 'package:dio_example_n6/ui/app_router.dart';
import 'package:dio_example_n6/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.transaction);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color.fromARGB(255, 21, 18, 32),
              ))
        ],
        title: Text(
          "Income",
          style:
              GoogleFonts.raleway(color: const Color.fromARGB(255, 21, 18, 32)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<CategoryViewModel>(
          builder: (context, categoryViewModel, child) {
        if (categoryViewModel.errorForUI.isNotEmpty) {
          return Center(
            child: Text(categoryViewModel.errorForUI),
          );
        }
        var datalist = categoryViewModel.categories;
        return categoryViewModel.categories != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: datalist!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 15),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 18, 38, 57),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  datalist[index].icon.toString(),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  datalist[index].incomeType,
                                  style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
