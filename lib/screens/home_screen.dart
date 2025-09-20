// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hotel_app/helper/images.dart';
import 'package:hotel_app/helper/widgets/custom_rating_stars.dart';
import 'package:hotel_app/helper/widgets/custom_tabs.dart';
import 'package:hotel_app/helper/widgets/image_card.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool expanded = false;
  String activeTab = "Offers";
  final TextEditingController fixedPriceController = TextEditingController(
    text: "5000",
  );

  double price = 1;
  final TextEditingController priceController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    fixedPriceController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Smart Hotel Booking",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCard(expanded: expanded),

            expanded
                ? SizedBox(height: size.height * 0.035)
                : SizedBox(height: size.height * 0.0525),

            CustomTabs(
              activeTab: activeTab,
              onTabChanged: (tab) {
                setState(() {
                  activeTab = tab;
                  expanded = (tab == "Guest Reviews");
                });
              },
            ),

            SizedBox(height: size.height * 0.03),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child:
                  expanded
                      ? Padding(
                        key: const ValueKey("reviews"),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.041,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "John D.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      const CustomRatingStars(
                                        color: Color(0xff22C55E),
                                        count: 3,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Amazing stay, highly recommend the spa!",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff475569),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Text(
                                        "Sarah K.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      const CustomRatingStars(
                                        color: Color(0xff22C55E),
                                        count: 4,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Great service, room was very clean.",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff475569),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Price Range:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            TextFormField(
                              controller: fixedPriceController,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 5000 / 10000),
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              builder: (context, value, child) {
                                return LinearProgressIndicator(
                                  value: value,
                                  minHeight: 8,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                );
                              },
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text("\$1"), Text("\$10k")],
                            ),
                          ],
                        ),
                      )
                      : Padding(
                        key: const ValueKey("offers"),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.041,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: size.height * 0.2225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  size.width * 0.0615384,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(Myimages.offer),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Price Range:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            TextFormField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: "\$1",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.trending_up, size: 25),
                                  onPressed: () {
                                    final value = double.tryParse(
                                      priceController.text,
                                    );
                                    if (value != null &&
                                        value >= 1 &&
                                        value <= 10000) {
                                      setState(() {
                                        price = value;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(
                                begin: 0,
                                end: (price / 10000).clamp(0.0, 1.0),
                              ),
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOut,
                              builder: (context, value, child) {
                                return LinearProgressIndicator(
                                  value: value,
                                  minHeight: 8,
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                );
                              },
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [Text("\$1"), Text("\$10k")],
                            ),
                          ],
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
