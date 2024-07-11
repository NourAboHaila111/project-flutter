import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final int productId;

  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    // هنا يمكنك استدعاء البيانات بناءً على productId
    // مثلاً:
    // final product = getProductById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Product ID: $productId'),
            // هنا يمكنك إضافة المزيد من تفاصيل المنتج
          ],
        ),
      ),
    );
  }
}