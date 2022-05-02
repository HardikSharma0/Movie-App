import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapp/favorites_cubit.dart';
import './screens/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieFavoritesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        home: HomeScreen(),
        theme: ThemeData(primarySwatch: Colors.blueGrey),
      ),
    );
  }
}
