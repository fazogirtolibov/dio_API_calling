import 'package:dio_example_n6/ui/app_router.dart';
import 'package:dio_example_n6/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Color.fromARGB(255, 21, 18, 32),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.web);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color.fromARGB(255, 21, 18, 32),
            ),
          )
        ],
        title: Text(
          "Transaction",
          style:
              GoogleFonts.raleway(color: const Color.fromARGB(255, 21, 18, 32)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<TransactionViewModel>(
          builder: (context, transactionViewModel, child) {
        if (transactionViewModel.errorForUI.isNotEmpty) {
          return Center(
            child: Text(transactionViewModel.errorForUI),
          );
        }
        var datalist = transactionViewModel.transactionModels;
        return transactionViewModel.transactionModels != null
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  datalist[index]
                                      .data[index]
                                      .receiver
                                      .brandImage,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    datalist[index].data[index].receiver.name,
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    datalist[index]
                                        .data[index]
                                        .receiver
                                        .location,
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
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
