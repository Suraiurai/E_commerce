import 'package:e_commerce_flutter/domain/blocs/addtobox/addtobox_bloc.dart';
import 'package:e_commerce_flutter/domain/blocs/fav_bloc/fav_product_bloc.dart';
import 'package:e_commerce_flutter/domain/blocs/search_dlegate/search_bloc.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/bottomnavpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'domain/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'domain/blocs/carousel_dots/carousel_dots_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Registering the adapter
  Hive.registerAdapter(ProductAdapter());

 
  await Hive.openBox('products');
   await Hive.openBox('fav_product');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
var box = Hive.box('products');

  @override
  Widget build(BuildContext context) {
    // box.clear();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBloc>(
          create: (_) => BottomNavBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(GetPSearch()),
        ),
        BlocProvider<CarouselDotsBloc>(
          create: (_) => CarouselDotsBloc(),
        ),
        BlocProvider<FavProductBloc>(
          create: (_) => FavProductBloc(),
        ),
         BlocProvider<AddtoboxBloc>(
          create: (_) => AddtoboxBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
