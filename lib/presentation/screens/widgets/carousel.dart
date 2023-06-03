import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, real) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: 
          
          Image.asset('assets/pic.jpg', fit: BoxFit.fill, width: 400));
      },
      options: CarouselOptions(
          viewportFraction: 0.8,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          enlargeCenterPage: true,
          height: 150,
          ),
    );
  }
}
