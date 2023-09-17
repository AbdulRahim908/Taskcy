import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hackathon/helper/storagehelper.dart';

class AddProductView extends StatefulWidget {
  AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  TextEditingController description  = TextEditingController();
  TextEditingController title = TextEditingController();
  // TextEditingController ProductDetails = TextEditingController();

  void clearText() {
    description.clear();
    title.clear();
    // ProductDetails.clear();
  }

  // TextEditingController image = TextEditingController();
  addProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({
          "name": title.text, 
          'detail': description.text
          // "image":image.text
        })
        .then((value) => print("Product Added"))
        .catchError((e) => print(e));
  }

  var results;

  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text("Create", style: TextStyle(
                          fontFamily: 'AbrilFatface',
                          color: Colors.black,
                          fontSize: 35.0),)),SizedBox(height: 20,),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: TextField(
                      controller: title,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'Enter project title',
                        labelText: 'Name',
                      ),
                    ),
                  )),
            ),
            // Center(
            //   child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 8,
            //       ),
            //       child: SizedBox(
            //         width: 350,
            //         height: 80,
            //         child: TextField(
            //           controller: productPrice,
            //           decoration: const InputDecoration(
            //             border: InputBorder.none,
            //             filled: true,
            //             hintText: 'Enter product price here',
            //             labelText: 'Price',
            //           ),
            //         ),
            //       )),
            // ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 80,
                    child: TextField(
                      controller: description,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: 'Enter project details',
                        labelText: 'details',
                      ),
                    ),
                  )),
            ),
            SizedBox(width: 200,
              child: ElevatedButton(
                  onPressed: () async {
                    results = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'jpeg', 'png', 'jpg'],
                    );
                    setState(() {
                      results = results;
                    });
                    if (results == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No file selected"),
                        ),
                      );
                      return null;
                    }
                    final pathname = results.files.single.path;
                    final filename = results.files.single.name;
                    storage.uploadFile(pathname, filename);
                  },
                  child: Text("Upload  image")),
            ),
            ElevatedButton(
              onPressed: () {
                addProduct();
                clearText();
              },
              child: const Text("Add "),
            )
          ],
        ),
      ),
    );
  }
}
