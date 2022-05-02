import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapp/models/movie.dart';

//
// class FavoritesCubit extends Cubit<FavoritesState> {
//   FavoritesCubit() : super(FavoritesInitial());
// }

class MovieFavoritesCubit extends Cubit<List<Movies>> {
  MovieFavoritesCubit() : super([]);

  void addMovieToFav(Movies movie) {
    emit([...state, movie]);
  }
}
