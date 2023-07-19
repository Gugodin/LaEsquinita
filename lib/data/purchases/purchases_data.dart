import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laesquina/domain/domain.dart';

class PurchasesData extends PurchasesRepositorie{
  FirebaseFirestore db;

  PurchasesData({
    required this.db,
  });

  @override
  Future<void> sendOrder(Map order,String details) async{
    // TODO: implement sendOrder
    throw UnimplementedError();
  }

}