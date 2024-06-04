import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = image!.lengthSync();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = http.MultipartRequest('POST', uri);
    request.fields['title'] = 'Static Title';

    var multipart = http.MultipartFile('image', stream, length);
    request.files.add(multipart);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print('Image Uploaded');
    } else {
      print('error uploading image');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent.shade100,
          centerTitle: true,
          title: const Text('Uploading Image'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: image == null
                      ? GestureDetector(
                          onTap: () => getImage(),
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  color: Colors.yellowAccent.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 100,
                              height: 50,
                              child: const Center(child: Text('Pick Image'))))
                      : Container(
                          child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ))),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  uploadImage();
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: 170,
                    child: const Center(
                        child: Text('Upload',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
