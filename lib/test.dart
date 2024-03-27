import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shopify/model/products_model.dart';

import 'package:shopify/provider/products_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    final providerdata = Provider.of<ProductProvider>(context, listen: false);
    providerdata.getDataFromApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productproviderdata = Provider.of<ProductProvider>(context);
    final media = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
              centerTitle: true,
              title: const Text(
                'Nesto Hypermarket',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              actions: const [Icon(Icons.menu)],
            ),
            body: productproviderdata.isloading
                ? getProductsLoadingUi()
                : productproviderdata.error.isNotEmpty
                    ? getProductsErrorUI(productproviderdata.error)
                    : getProductsBodyUI(productproviderdata.products, media
                        )));
  }

  Widget getProductsLoadingUi() {
    return const Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitFadingCircle(
            color: Color.fromARGB(255, 204, 11, 11),
            size: 90.0,
          ),
          Text(
            "Loading....",
            style: TextStyle(fontSize: 20, color: Colors.amber),
          )
        ],
      ),
    );
  }

  Widget getProductsErrorUI(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.orange, fontSize: 22),
      ),
    );
  }

  Widget getProductsBodyUI(Products productsall, Size media) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: media.width * .02),
          height: media.height * 0.07,
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.grey),
              borderRadius: BorderRadius.circular(40)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Icon(
                      Icons.qr_code,
                      color: Colors.grey,
                    ),
                    Text(
                      "|",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Fruits",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: productsall.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.3),
              itemBuilder: (constext, index) {
                final uriimage = productsall.data[index].image;

                final nameitem = productsall.data[index].name;
                final prices = productsall.data[index].price;
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
                                image: NetworkImage("http://143.198.61.94$uriimage"),
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
                                                nameitem,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                   "\$$prices/-",
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
              }
              ),
        ),
      ],
    );
  }
}