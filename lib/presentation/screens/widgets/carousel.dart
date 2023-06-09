import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_flutter/domain/blocs/carousel_dots/carousel_dots_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
   List images = ['Rectangle 4.png','Rectangle 5.png','Rectangle 6.png'];
    return BlocBuilder<CarouselDotsBloc, CarouselDotsState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, real) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: 
              Image.asset('assets/${images[index]}', fit: BoxFit.fill, width: 400));
          },
          options: CarouselOptions(
            initialPage: state.index,
            onPageChanged: (index, reason) {
              context.read<CarouselDotsBloc>()..add(OnChangeEvent(index));
            },
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              enlargeCenterPage: true,
              height: 150,
              ),
        );
      },
    );
  }
}
