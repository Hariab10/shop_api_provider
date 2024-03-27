import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/provider/customer_provider.dart';
import 'package:shopify/provider/products_provider.dart';
import 'package:shopify/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CustomerProvide()),
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
