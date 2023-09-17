import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon/screens/loginView.dart';

class Project extends StatelessWidget {
  Project({super.key});
  TextEditingController search_control = TextEditingController();
  CollectionReference projects =
      FirebaseFirestore.instance.collection("projects");
  getAllProjects() async {
    return projects.get();
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
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(child: Icon(Icons.arrow_back_ios_new),onTap:(){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );})),
                Text(
                  "Project",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white, child: GestureDetector(child: Icon(Icons.add))),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: TextField(
                        controller: search_control,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintText: 'Search ',
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    )),
              ),
              FutureBuilder(
                  future: getAllProjects(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          // gridDelegate:
                          //     const SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 1),
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  width: 500,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  snapshot.data.docs[index]
                                                      ['title'],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 90,
                                              ),
                                              Image.network(
                                                snapshot.data.docs[index]
                                                    ['rating'],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data.docs[index]
                                                ['description'],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image.network(
                                                snapshot.data.docs[index]
                                                    ['image'],
                                              ),
                                              Image.network(
                                                snapshot.data.docs[index]
                                                    ['progress'],
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ]))));
  }
}
