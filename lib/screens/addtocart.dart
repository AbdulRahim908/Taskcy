import 'package:flutter/material.dart';

class AddCart extends StatefulWidget {
   AddCart({super.key, });

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
//  var data1;
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
                  'Your Cart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              
              ),
            )
          ],
        ),Image(image: AssetImage("assets/images/emptycart.png")),
        // ListView.builder(
        //             physics: const NeverScrollableScrollPhysics(),
        //             shrinkWrap: true,
        //             itemCount: 1,
                    
        //             itemBuilder: (context, index) {
        //               return ListTile(leading: data1['image'],title:  data1['name'],trailing: data1['price']
        //                 ,
        //                );})

        SizedBox(
          height: 300,
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
                onPressed: () {},
                child: const Text(
                  "Proceed to pay",
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
