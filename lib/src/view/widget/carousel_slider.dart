import 'package:flutter/material.dart';
import 'package:rsc_motorshop/core/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  // Function to load image with error handling
  Widget loadImage(String imagePath) {
    try {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,  // Ensure the image takes up the full width
        height: MediaQuery.of(context).size.height * 0.32, // Set a consistent height for all images
      );
    } catch (e) {
      // If the image asset is not found, return a fallback image
      return Image.asset(
        'assets/images/default_image.jpg', // Replace with your default image path
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,  // Ensure the fallback image takes up full width
        height: MediaQuery.of(context).size.height * 0.32, // Set a consistent height
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height * 0.32, // Adjust the height for consistency
          width: width,  // Ensure the width matches the screen width
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: loadImage(widget.items[index]), // Load image with error handling
              );
            },
          ),
        ),
        AnimatedSmoothIndicator(
          effect: const WormEffect(
            dotColor: Color.fromARGB(255, 0, 238, 255),
            activeDotColor: Color.fromARGB(255, 0, 0, 0),
          ),
          count: widget.items.length,
          activeIndex: newIndex,
        ),
      ],
    );
  }
}
