import 'package:flutter/material.dart';

cardWidget(heading, title,numbers) {
  return SizedBox(height: 150,width: 300,
    child: Card(color: Colors.deepPurpleAccent,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [SizedBox(height: 10,),
          Text(" $heading",style: TextStyle(fontSize: 20,color: Colors.white),),
          Text(" $title",style: TextStyle(color: Colors.white),),SizedBox(height: 35,),
          Row(
            children: [
              Image(image: AssetImage("assets/images/People.png")),SizedBox(width: 10,),
              Column(
                children: [
                  Text("progress",style: TextStyle(color: Colors.white)),
                  Image(image: AssetImage("assets/images/Progres.png"))
                ],
              ),Text("$numbers",style: TextStyle(color: Colors.white))
            ],
          )
        ],
      ),
    ),
  );
}
