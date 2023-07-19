import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laesquina/blocs/products/bloc/products_bloc.dart';
import 'package:laesquina/data/products/products_data.dart';
import 'routes/routes.dart' as route;
import 'blocs/blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final db = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    // final data = ProductData(db: db);
    // data.getAllProducts();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
        create: (context) => ProductsBloc(ProductData(db: db))..add(const GetAllProducts()),
        lazy: false,
      ),
        BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
      ),
        BlocProvider<ShoppingBloc>(
          lazy: false,
        create: (context) => ShoppingBloc(ProductData(db: db))..add(const FillShoppingCar()),
      )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        onGenerateRoute: route.controller,
        initialRoute: route.mainScreen,
      ),
    );
  }
}
