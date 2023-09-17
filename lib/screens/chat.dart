import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users extends StatelessWidget {
  Users({super.key});
  TextEditingController search_control = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  getAllusers() async {
    return users.get();
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
                    child: Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Chat",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white, child: Icon(Icons.add)),
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
                  future: getAllusers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                snapshot.data.docs[index]['image'],
                              ),
                              title: Text(
                                snapshot.data.docs[index]['Title'],
                              ),
                              subtitle:Text( snapshot.data.docs[index]['active'],),
                              trailing:  Image.network(snapshot.data.docs[index]['camera'],)
                            );

                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ]))));
  }
}
