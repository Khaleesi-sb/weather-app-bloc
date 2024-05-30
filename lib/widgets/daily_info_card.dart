import 'package:flutter/material.dart';

import 'custom_text.dart';

class DailyInfoCard extends StatefulWidget {
  const DailyInfoCard({super.key, required this.title, required this.subtitle, required this.image});

  final String title;
  final String subtitle;
  final String image;

  @override
  State<DailyInfoCard> createState() => _DailyInfoCardState();
}

class _DailyInfoCardState extends State<DailyInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(widget.image, scale: 8,),
        // const SizedBox(
        //   width: 5,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: widget.title,
                textFontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(text: widget.subtitle,
                textFontWeight: FontWeight.w700,
              )
            ],
          ),
        )
      ],
    );
  }
}
