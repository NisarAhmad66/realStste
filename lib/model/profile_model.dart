import 'package:get/get.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final bool approved;
  final bool reject;
  final bool pending;
  final double price;

  Product({
    required this.id,
    required this.approved,
    required this.description,
    required this.pending,
    required this.price,
    required this.reject,
    required this.title,
  });

  final isFavorite = false.obs;
}
