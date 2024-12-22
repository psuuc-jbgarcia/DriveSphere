import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rsc_motorshop/src/view/screen/cart_screen.dart';
import 'package:rsc_motorshop/src/controller/product_controller.dart';
import 'package:rsc_motorshop/src/view/widget/product_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getFavoriteItems();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrangeAccent, // Add a vibrant background color
        title: Row(
          children: [
            Icon(
              Icons.favorite, // Add a favorite icon to enhance the title
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              "Favorites",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Make the title stand out
                  ),
            ),
          ],
        ),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<ProductController>(
          builder: (controller) {
            return Column(
              children: [
                // Add a message if no items are in the favorites list
                controller.filteredProducts.isEmpty
                    ? Center(
                        child: Text(
                          "No favorites added yet!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ProductGridView(
                          items: controller.filteredProducts,
                          likeButtonPressed: (index) => controller.isFavorite(index),
                          isPriceOff: (product) => controller.isPriceOff(product),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
