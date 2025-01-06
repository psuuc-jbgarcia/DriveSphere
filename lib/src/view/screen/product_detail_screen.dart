import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rsc_motorshop/core/app_color.dart';
import 'package:rsc_motorshop/src/model/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rsc_motorshop/src/view/widget/page_wrapper.dart';
import 'package:rsc_motorshop/src/view/widget/carousel_slider.dart';
import 'package:rsc_motorshop/src/controller/product_controller.dart';
import 'package:quickalert/quickalert.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 4,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.45,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 121, 226).withOpacity(0.7),
            Color.fromARGB(255, 255, 121, 226),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(150),
          bottomLeft: Radius.circular(150),
        ),
      ),
      child: Stack(
        children: [
          CarouselSlider(items: product.images),
        ],
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: product.rating,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const FaIcon(
            FontAwesomeIcons.solidStar,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        Text(
          "(4500 Reviews)",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(product).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () => controller.switchBetweenProductSizes(product, index),
          child: AnimatedContainer(
            margin: const EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.center,
            width: controller.isNominal(product) ? 45 : 80,
            decoration: BoxDecoration(
              color: controller.sizeType(product)[index].isSelected
                  ? AppColor.lightOrange
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.5,
              ),
            ),
            duration: const Duration(milliseconds: 300),
            child: FittedBox(
              child: Text(
                controller.sizeType(product)[index].numerical,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: PageWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productPageView(width, height),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _ratingBar(context),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "${product.price}",
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.about,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 45,
                        child: GetBuilder<ProductController>(
                          builder: (_) => productSizesListView(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: product.isAvailable
                              ? () {
                                  controller.addToCart(product);

                                  // Show alert message after adding product
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    title: 'Success',
                                    text: 'Product added to Canvas',
                                    autoCloseDuration: const Duration(seconds: 2),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: product.isAvailable
                                ? AppColor.darkOrange
                                : Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Add to Canvas",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
