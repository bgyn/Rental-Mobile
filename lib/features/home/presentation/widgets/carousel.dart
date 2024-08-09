import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});
  static final List<String> imgList = [
    'https://images.unsplash.com/photo-1521239365713-1e26965c69ac?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmVudHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1516639247296-fa8ce789fd7a?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1661755100242-618b5a580db9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHJlbnR8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1590986201364-ce95ab280ca2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVudHxlbnwwfHwwfHx8MA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: imgList[index],
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return SizedBox(
                width: double.infinity,
                height: 400,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enableInfiniteScroll: true,
        initialPage: 0,
        viewportFraction: 1,
      ),
    );
  }
}
