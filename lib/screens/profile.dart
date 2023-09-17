import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

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
                  "Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white, child: Icon(Icons.add)),
              ],
            ),
          ),
        ),
        body: Column(
          children: [SizedBox(height: 20,),
            Center(
                child: Column(
              children: [
                Image.asset("assets/images/profile.png"),
                Text(
                  "Alvart Ainstain",
                  style: TextStyle(
                       fontSize: 20, fontWeight: FontWeight.bold),
                ),Text(
                  "@albert.ainstain",
                  style: TextStyle(
                       fontSize: 15, ),
                ),ElevatedButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Colors.white,),)
              ],
            )), Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Text("My projects",style: TextStyle(fontSize: 20),),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    )), GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Text("Join a team",style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    )), GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Text("Setting",style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    )), GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Text("My tasks",style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    )),
              ],
            ),
          ],
        ));
  }
}
