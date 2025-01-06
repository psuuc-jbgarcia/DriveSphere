import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rsc_motorshop/core/app_data.dart';
import 'package:rsc_motorshop/core/app_color.dart';
import 'package:rsc_motorshop/src/controller/product_controller.dart';
import 'package:rsc_motorshop/src/view/widget/product_grid_view.dart';
import 'package:rsc_motorshop/src/view/widget/list_item_selector.dart';

enum AppbarActionType { leading, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  Widget appBarActionButton(AppbarActionType type) {
    IconData icon = Icons.ac_unit_outlined;

    if (type == AppbarActionType.trailing) {
      icon = Icons.search;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 240, 91, 5),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: const Icon(Icons.menu, color: Colors.white),
      ),
    );
  }

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // // Add leading button if needed
                  // appBarActionButton(AppbarActionType.leading),
                  // // Add trailing button
                  // appBarActionButton(AppbarActionType.trailing),
                ],
              ),
            ),
            // Add Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  controller.filterProductsBySearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  hintText: 'Search products...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget mostBuyItemsSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          "Most Bought Items",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 220, // Height adjusted for better layout
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppData.mostBuyItems.length,
          itemBuilder: (_, index) {
            final product = AppData.mostBuyItems[index];
            return Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 160, // Adjusted width for balance
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.shade100,
                        Colors.orange.shade200,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          product.images[0],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "₱${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppData.recommendedProducts.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: AppData.recommendedProducts[index].cardBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Drive Your Dream, ! \nSave Big Today!',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppData.recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                color: AppData.recommendedProducts[index]
                                    .buttonTextColor!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/shopmoto.png',
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top categories",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColor.darkOrange),
            child: Text(
              "SEE ALL",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.deepOrange.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to DriveSphere",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black,
                      ),
                ),
                Text(
                  "Let's get something?",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                ),
                
                _recommendedProductListView(context),
                                              mostBuyItemsSection(context), // Add the section here

                _topCategoriesHeader(context),
                _topCategoriesListView(),

                GetBuilder<ProductController>(
                  builder: (controller) {
                    return ProductGridView(
                      items: controller.filteredProducts,
                      likeButtonPressed: (index) => controller.isFavorite(index),
                      isPriceOff: (product) => controller.isPriceOff(product),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
