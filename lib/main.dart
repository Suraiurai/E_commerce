import 'package:e_commerce_flutter/domain/blocs/search_dlegate/search_bloc.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/domain/models/repository.dart';
import 'package:e_commerce_flutter/presentation/screens/pages/bottomnavpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'domain/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  // Registering the adapter
  Hive.registerAdapter(ProductAdapter());
  //  Hive
  //     ..initFlutter()
  //     ..registerAdapter(ProductAdapter());

  await Hive.openBox('products');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
         BlocProvider<BottomNavBloc>(
          create: (context) =>
              BottomNavBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) =>
              SearchBloc(GetPSearch()),
        ),
      

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
