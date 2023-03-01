import 'dart:io';
import 'package:dio_example_n6/ui/app_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImgagePicker extends StatefulWidget {
  const ImgagePicker({Key? key}) : super(key: key);

  @override
  State<ImgagePicker> createState() => _ImgagePickerState();
}

class _ImgagePickerState extends State<ImgagePicker> {
  File? selectedFile;
  @override
  Widget build(BuildContext context) {
    Future<File?> selectFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        return File(result.files.single.path!);
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.dynamic);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color.fromARGB(255, 21, 18, 32),
            ),
          )
        ],
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
          "Image Picker",
          style:
              GoogleFonts.raleway(color: const Color.fromARGB(255, 21, 18, 32)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 19, 24, 35)),
                  onPressed: () async {
                    File? myFile = await selectFile();

                    if (myFile != null) {
                      selectedFile = myFile;
                      setState(() {});
                    }
                  },
                  child: const Text("Select file")),
              selectedFile != null
                  ? Image.file(
                      selectedFile!,
                      height: 300,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
