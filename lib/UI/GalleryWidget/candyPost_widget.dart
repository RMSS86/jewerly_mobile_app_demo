import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/Gallery/model/CandyPostModel.dart';
import '../../models/Gallery/model/candyLineListModel.dart';
import '../../models/Gallery/model/location.dart';

import 'expanded_content_widget.dart';
import 'image_widget.dart';

class CandyPostWidget extends StatefulWidget {
  final CandyPost candyPost;

  const CandyPostWidget({
    required this.candyPost,
     Key? key,
  }) : super(key: key);//

  @override
  _CandyPostWidgetState createState() => _CandyPostWidgetState();
}

class _CandyPostWidgetState extends State<CandyPostWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,

        children: [

          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: ExpandedContentWidget(location: widget.candyPost),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(

              onPanUpdate: onPanUpdate,
              onTap: () {

              },
              child: ImageWidget(candy_: widget.candyPost,),
            ),

          ),
        ],
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
