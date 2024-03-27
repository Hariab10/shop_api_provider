import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Sample> {
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

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          'customers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/menu.png"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 150,
                ),
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 100,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 25),
                          child: VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 40,
                                  width: 240,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          "data",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.call),
                                            Icon(Icons.chat)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 240,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "ID :",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 240,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              width: 240,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Due Amount :",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " 4",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
