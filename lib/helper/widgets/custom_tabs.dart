import 'package:flutter/material.dart';

class CustomTabs extends StatefulWidget {
  final String activeTab;
  final ValueChanged<String> onTabChanged;

  const CustomTabs({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.0410),
      height: size.height * 0.0625,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(size.width * 0.0641),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            alignment:
                widget.activeTab == "Offers"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            child: Container(
              width: size.width * 0.4,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(size.width * 0.0641),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => widget.onTabChanged("Offers"),
                  child: Center(
                    child: Text(
                      "Offers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            widget.activeTab == "Offers"
                                ? Colors.white
                                : Color(0xff64748B),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => widget.onTabChanged("Guest Reviews"),
                  child: Center(
                    child: Text(
                      "Guest Reviews",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            widget.activeTab == "Guest Reviews"
                                ? Colors.white
                                : Color(0xff64748B),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
