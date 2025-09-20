// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hotel_app/helper/widgets/custom_rating_stars.dart';
import 'package:hotel_app/helper/images.dart';

class ImageCard extends StatelessWidget {
  final bool expanded;

  const ImageCard({super.key, required this.expanded});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.041),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              expanded
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: double.infinity,
              height: expanded ? size.height * 0.3 : size.height * 0.2225,
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius:
                    expanded
                        ? const BorderRadius.vertical(top: Radius.circular(6))
                        : BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(Myimages.hotel),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child:
                  expanded
                      ? Padding(
                        key: const ValueKey("texts"),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Grand Hyatt Manila",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const CustomRatingStars(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Deluxe King Room",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Deluxe King Room a to din I Ansor",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
