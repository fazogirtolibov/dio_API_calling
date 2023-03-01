import 'package:dio_example_n6/view_model/dynamic_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({Key? key}) : super(key: key);

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
        title: Text(
          "Dynamic",
          style:
              GoogleFonts.raleway(color: const Color.fromARGB(255, 21, 18, 32)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<DynamicViewModel>(
          builder: (context, value, child) {
            if (value.errorForUI.isNotEmpty) {
              return Text(value.errorForUI);
            }
            var datalist = value.informartions;
            return value.informartions != null
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: datalist!.fields!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 15),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 18, 38, 57),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Text(
                                          datalist.fields[index].code
                                              .toString(),
                                        )),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          datalist.fields[index].initialValue,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "name: ${datalist.fields[index].sort}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
