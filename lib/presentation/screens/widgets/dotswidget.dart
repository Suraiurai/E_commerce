import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/carousel_dots/carousel_dots_bloc.dart';
import '../../themes/colors.dart';

class DotsWidget extends StatelessWidget {
   DotsWidget({
    super.key, required this.dotscount
    
  });
final int dotscount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselDotsBloc, CarouselDotsState>(
      builder: (context, state) {
        return Center(
          child: DotsIndicator(
            dotsCount: dotscount,
            position: state.index,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: ColorsUI.primaryColorFrave,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        );
      },
    );
  }
}