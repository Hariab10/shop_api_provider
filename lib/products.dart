import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
  @override
  Widget build(BuildContext context) {
    var selectedItems = 8;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/menu.png"),
          )
        ],
        title: Center(child: Text("Nest Hypermarket")),
        leading: Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 390,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.qr_code),
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 677,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 150),
              itemCount: selectedItems,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(37, 158, 158, 158),
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // child: Center(
                  //   // child: Text(
                  //   //   name[index],
                  //   //   style: TextStyle(fontSize: 20),
                  //   // ),
                  // ),
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 200,
                        color: const Color.fromARGB(0, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 1, left: 50, right: 50),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              image: DecorationImage(
                                image: AssetImage(imagePathList[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 60,
                          width: 200,
                          color: const Color.fromARGB(0, 255, 193, 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.0,
                                          width: 127,
                                          child: Column(
                                            children: [
                                              Text(
                                                "data",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                "data",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 0, 107, 194),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
