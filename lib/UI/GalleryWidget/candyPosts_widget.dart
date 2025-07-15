import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Theme/ThemeProvider.dart';
import '../../models/Gallery/GalleryData/CandLineData.dart';
import '../../models/Gallery/GalleryData/locations.dart';

import 'candyPost_widget.dart';

class GalleryListWidget extends StatefulWidget {
  @override
  _GalleryListWidgetState createState() => _GalleryListWidgetState();
}

class _GalleryListWidgetState extends State<GalleryListWidget> {


  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(

        children: [
          SizedBox(height: 99),
          Image.asset(
            Provider.of<ThemeProvider>(context).isDarkMode == true ?
            'assets/ecommerce/SBJ_logoLetters_only_white.png' :
            'assets/ecommerce/SBJ_logoLetters_only_black.png'
            , width: 180,),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: CandyLineData.models_.length,
              itemBuilder: (context, index) {
                final post_ = CandyLineData.models_[index];

                return CandyPostWidget(candyPost: post_);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),

          buildIndicator(),//condition on theme selection!

          SizedBox(height: 21)
        ],
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    effect: ExpandingDotsEffect(
        dotWidth: 18, activeDotColor: Theme.of(context).colorScheme.surfaceDim),
    activeIndex: pageIndex,
    count: locations.length,
  );
}

// Text(
//   '${pageIndex + 1}/${locations.length}',
//   style: TextStyle(color: Colors.white70,
//   ),
// ),