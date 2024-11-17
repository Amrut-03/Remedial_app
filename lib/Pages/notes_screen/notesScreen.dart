import 'dart:io';

import 'package:Remedial_App/Pages/Home_screen.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';

class NotesInterface extends StatefulWidget {
  const NotesInterface({super.key});

  @override
  State<NotesInterface> createState() => _NotesInterfaceState();
}

class _NotesInterfaceState extends State<NotesInterface> {
  PlatformFile? pickedFile;
  String url = '';
  Future<ListResult>? futurFiles;
  Map<int, double> DownloadProgress = {};
  bool isLoading = true;
  bool isInternetConnected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();

    futurFiles = FirebaseStorage.instance.ref('/Cse_Notes').listAll();

    setState(() {
      isLoading = false;
    });
  }

  showdilog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Upload Pdf file',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            actions: [
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => selectFile(),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(200.w, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "Select File",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(200.w, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          uploadFile();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                'File Uploaded successfully',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )));
                        },
                        child: Text(
                          "Upload",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              )
            ],
          );
        });
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'File Selected Successfully',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        )));
  }

  Future uploadFile() async {
    print("*************** file in uploading process");

    if (pickedFile == null || pickedFile!.path == null) {
      print("No file selected.");
      return;
    }

    final path = 'Cse_Notes/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    if (file == null) {
      print("File is null.");
      return;
    }
    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      await ref.putFile(file);
      url = await ref.getDownloadURL();
      setState(() {});
      print("****************** file uploaded $url");
    } catch (e) {
      print("Error uploading file: $e");
    }
    print("****************** file uploaded ");
  }

  void openPdf(BuildContext context, Reference file) async {
    final downloadUrl = await file.getDownloadURL();

    // Create a Dio instance
    Dio dio = Dio();

    try {
      // Download the PDF file using Dio
      Response response = await dio.get(downloadUrl,
          options: Options(responseType: ResponseType.bytes));

      // Get the local app directory for storing the PDF file
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Create a file path for the PDF file
      String pdfFilePath = '$appDocPath/my_pdf_file.pdf';

      // Write the downloaded PDF content to the local file
      File pdfFile = File(pdfFilePath);
      await pdfFile.writeAsBytes(response.data);

      // Create a PDFDocument from the local file
      PDFDocument document = await PDFDocument.fromFile(pdfFile);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('PDF Viewer'),
            ),
            body: Container(
              child: PDFViewer(document: document),
            ),
          ),
        ),
      );

      // Optionally, you can print the local path where the PDF file is saved
      print('PDF saved to: $pdfFilePath');
    } catch (e) {
      print('Error downloading PDF: $e');
      // Handle the error appropriately
    }
  }

  Future<void> _refreshFiles() async {
    setState(() {
      isLoading = true;
      futurFiles = FirebaseStorage.instance.ref('/Cse_Notes').listAll();
    });

    await futurFiles;

    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteFile(Reference fileRef) async {
    try {
      // Delete the file from Firebase Storage
      await fileRef.delete();

      // Refresh the list of files
      await _refreshFiles();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'File Deleted Successfully',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
    } catch (e) {
      print("Error deleting file: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          'Error Deleting File',
          style: GoogleFonts.poppins(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));
    }
  }

  Future<void> checkInternetConnection() async {
    try {
      Response response = await Dio().get("https://www.google.com");
      setState(() {
        isInternetConnected = response.statusCode == 200;
      });
    } catch (e) {
      setState(() {
        isInternetConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: data['role'] == 'admin',
        child: FloatingActionButton(
            onPressed: () {
              showdilog();
            },
            child: Icon(
              Icons.upload_file,
              size: 30.w,
              color: Colors.black,
            ),
            backgroundColor: Colors.white),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "Resources",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
              color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshFiles,
        child: FutureBuilder<ListResult>(
          future: futurFiles,
          builder: (context, snapshot) {
            if (snapshot.hasData && isInternetConnected) {
              final files = snapshot.data!.items;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 600.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];
                          double? progress = DownloadProgress[index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => openPdf(context, file),
                                onLongPress: () => showDeleteConfirmation(file),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, right: 20, bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        file.name,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: progress != null
                                          ? LinearProgressIndicator(
                                              value: progress,
                                              backgroundColor: Colors.grey,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              isInternetConnected = false;
              return Center(
                child: Text(
                  "Something went wrong. Check your internet connection.",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              );
            } else
              return Shimmer.fromColors(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shimmer_padding(height: 600.h, width: 350.w, rad: 10.r),
                      SizedBox(height: 0.h),
                    ],
                  ),
                ),
                highlightColor: Colors.grey.shade100,
                baseColor: Colors.grey.shade500,
              );
          },
        ),
      ),
    );
  }

  Center shimmer_padding(
      {required double height, required double width, required double rad}) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rad),
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> showDeleteConfirmation(Reference file) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Visibility(
          visible: data['role'] == 'admin',
          child: AlertDialog(
            title: Text(
              'Delete File?',
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600, color: Colors.black),
            ),
            content: Text(
              'Are you sure you want to delete this file?',
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w600, color: Colors.black),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  deleteFile(file);
                  Navigator.pop(context);
                },
                child: Text(
                  'Delete',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
