import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ImageCarrousel extends StatefulWidget {
  const ImageCarrousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarrousel> createState() => _ImageCarrouselState();
}

class _ImageCarrouselState extends State<ImageCarrousel> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: AppImages.demoBigImages.length,
            itemBuilder: ((context, index) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(AppImages.demoBigImages[index]),
                )),
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Row(
              children: List.generate(
                AppImages.demoBigImages.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    height: 4,
                    width: 8,
                    decoration: BoxDecoration(
                      color: index == currentPage ? Colors.white : Colors.white38,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
