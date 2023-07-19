import 'package:flutter/material.dart';
import 'package:laesquina/presentation/MainScreen/view/MainScreenView.dart';
import 'package:laesquina/presentation/MainScreen/widgets/OrderResume.dart';
// import '../presentation/views/views.dart';

const String mainScreen = 'mainScreen';
const String orderResume = 'orderResume';
// const String homePage = 'home';

Route<dynamic> controller (RouteSettings settings){

  switch (settings.name) {
    case mainScreen:
      return MaterialPageRoute(builder: (context) => const MainScreenView(),);
    case orderResume:
      return MaterialPageRoute(builder: (context) => const OrderResume(),);
    // case homePage:
      
    //   break;
    default:
      throw('This route name does not exist');
  }
  
}