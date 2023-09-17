import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/widget/card_widget.dart';
class MainHome extends StatelessWidget {
  MainHome({super.key});
  CollectionReference projects =
      FirebaseFirestore.instance.collection("projects");
  CollectionReference progress =
      FirebaseFirestore.instance.collection("progress");
  getAllProjects() async {
    return projects.get();
  }

  getAllProgress() async {
    return progress.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ImageIcon(AssetImage("assets/images/Category.png"))),
                Text(
                  "Friday,26",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.notifications)),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
              '''  Let's make a 
  habit together''',
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w900),
            )),            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                   cardWidget("Application Design", "UI degin kit", "50/80"),cardWidget("Overlay Design", "UI degin kit", "60/80"),cardWidget("Unity Dashboard", "UI degin kit", "40/80"),
                    const SizedBox(
                      width: 10,
                    ),
                    
                  ],
                )),
           
            // SingleChildScrollView(scrollDirection:Axis.horizontal, child: Row(),)
            // ,FutureBuilder(
            //     future: getAllProjects(),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.hasData) {
            //         return SingleChildScrollView(scrollDirection: Axis.horizontal,
            //           child: Row(
            //             children:<Widget> [
            //               GridView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   shrinkWrap: true,
            //                   itemCount: snapshot.data.docs.length,
            //                   gridDelegate:
            //                       const SliverGridDelegateWithFixedCrossAxisCount(
            //                           crossAxisCount: 3),
            //                   itemBuilder: (context, index) {
            //                     return Card(
            //                       color: Colors.deepPurpleAccent,
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(4.0),
            //                         child: GestureDetector(
            //                             onTap: () {},
            //                             child: Column(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.end,
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 Row(
            //                                   children: [
            //                                     Text(
            //                                         snapshot.data.docs[index]
            //                                             ['title'],
            //                                         style: const TextStyle(
            //                                             color: Colors.black,
            //                                             fontSize: 20,
            //                                             fontWeight:
            //                                                 FontWeight.bold)),
            //                                     SizedBox(
            //                                       width: 90,
            //                                     ),
            //                                     Image.network(
            //                                       snapshot.data.docs[index]
            //                                           ['rating'],
            //                                     )
            //                                   ],
            //                                 ),
            //                                 const SizedBox(
            //                                   height: 5,
            //                                 ),
            //                                 Text(
            //                                   snapshot.data.docs[index]
            //                                       ['description'],
            //                                   style: const TextStyle(
            //                                     color: Colors.grey,
            //                                     fontSize: 18,
            //                                   ),
            //                                 ),
            //                                 Row(
            //                                   children: [
            //                                     Image.network(
            //                                       snapshot.data.docs[index]
            //                                           ['image'],
            //                                     ),
            //                                     Image.network(
            //                                       snapshot.data.docs[index]
            //                                           ['progress'],
            //                                     ),
            //                                   ],
            //                                 )
            //                               ],
            //                             )),
            //                       ),
            //                     );
            //                   }),
            //             ],
            //           ),
            //         );
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     })

            
            GestureDetector(
                onTap: () {},
                child: ListTile(
                  leading: Text("In progress"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                )),
            FutureBuilder(
                future: getAllProgress(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: ListTile(
                                  // leading: Text(
                                  //     snapshot.data.docs[index]["heading"]),
                                  title:
                                      Text(snapshot.data.docs[index]["detail"]),
                                  subtitle:
                                      Text(snapshot.data.docs[index]["active"]),
                                  trailing: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 2.0)),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Text(
                                        snapshot.data.docs[index]["percent"],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ));
  }
}
