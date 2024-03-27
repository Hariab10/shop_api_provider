import 'package:flutter/material.dart';
import 'package:shopify/products.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> imagePathList = [
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
    'assets/package2.png',
  ];

  final List<String> name = [
    "Customers",
    "Products",
    "New Order",
    "Return Order",
    "Add Payment",
    "Today's Order",
    "Today's Summary",
    "Route"
  ];

  void onTap(BuildContext context, int index) {
    if (0 == index) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Products()));
    } else if (1 == index) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Products()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/menu.png"),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/pic.jpg',
            ),
          ),
        ),
      ),
      body: SizedBox(
        child: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: imagePathList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                onTap(context, index);
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 255, 193, 7),
                        image: DecorationImage(
                            image: AssetImage(imagePathList[index]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      name[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
