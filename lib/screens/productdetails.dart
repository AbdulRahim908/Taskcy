import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/screens/bottom.dart';
import 'package:hackathon/screens/addtocart.dart';

class ProductDetails extends StatelessWidget {
   
  var data;
  ProductDetails({super.key, this.data});
  // CollectionReference products =
  //     FirebaseFirestore.instance.collection("products");
  // getAllProducts() async {
  //   return products.get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                leading: SizedBox(
                  width: 60,
                  height: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 140, 196, 223)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      )),
                ),
              ),
            )
          ],
        ),GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 390,
                            width: 150,
                            // borderRadius: BorderRadius.circular(10)

                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    data['image'],
                                    height: 200,width: 700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data['price'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  data['detail'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )),);})
        // FutureBuilder(
        //     future: getAllProducts(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         return GridView.builder(
        //             physics: const NeverScrollableScrollPhysics(),
        //             shrinkWrap: true,
        //             itemCount: 1,
        //             gridDelegate:
        //                 const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 1),
        //             itemBuilder: (context, index) {
        //               return Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Container(
        //                     height: 100,
        //                     width: 150,
        //                     // borderRadius: BorderRadius.circular(10)

        //                     child: Column(
        //                       // mainAxisAlignment: MainAxisAlignment.end,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Image.network(
        //                           snapshot.data.docs[index]['image'],
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         Text(
        //                           snapshot.data.docs[index]['name'],
        //                           style: const TextStyle(
        //                               color: Colors.black,
        //                               fontSize: 40,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         Text(
        //                           snapshot.data.docs[index]['price'],
        //                           style: const TextStyle(
        //                             fontSize: 30,
        //                             color: Colors.black,
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         Text(
        //                           snapshot.data.docs[index]['detail'],
        //                           style: const TextStyle(
        //                             fontSize: 30,
        //                             color: Colors.black,
        //                           ),
        //                         )
        //                       ],
        //                     )),
        //               );
        //             });
        //       } 
        //       else {
        //         return const CircularProgressIndicator();
        //       }
        //     }),
        ,SizedBox(
          height: 220,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 41, 72)),
                onPressed: () { Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddCart(
                                              // data1:snapshot.data.docs[index]
                                                ),
                                          ),
                                        );},
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ]),
    ));
  }
}
