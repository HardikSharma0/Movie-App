import 'package:flutter/material.dart';
import 'package:mapp/models/fav.dart';
import 'package:mapp/models/movie.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mapp/favorites_cubit.dart';

class FavouritesScreen extends StatefulWidget {
  final movieObject;
  const FavouritesScreen(this.movieObject, {Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  // List<Movies> movies= favMovieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [Text('data'), Text("data"), Text('data')],
          )),
          Divider(
            thickness: 5,
          ),
          SingleChildScrollView(
              child: Column(
            children: [Container()],
          )),
        ],
      ),
    );

    // return ListView.builder(
    //     itemCount: context.read<MovieFavoritesCubit>().state.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return context
    //           .read<MovieFavoritesCubit>()
    //           .state
    //           .map((e) => ListTile(
    //                 title: Text('text'),
    //               ))
    //           .toList()
    //           .first;
    //     });
    // context.read<MoviesFavoriteCubit>().
    // context.read<MovieFavoritesCubit>().addMovieToFav(movie);
  }
}
