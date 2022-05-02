import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mapp/models/fav.dart';
import 'package:mapp/models/movie.dart';
import 'package:mapp/utils/constants.dart';
import 'package:mapp/utils/server.dart';

import 'moviedetailpreview.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movies> movie = [];
  // Movies? _movies;
  late FavMovie favMovie;
  storeMovieData() async {
    Response<dynamic> response = await Server.getMovies();
    Map<String, dynamic> map = response.data;
    List<dynamic> list = map['results'];
    movie = list
        .map((dynamic currentMovie) => new Movies(
              currentMovie['title'],
              currentMovie['overview'],
              currentMovie['poster_path'],
              currentMovie['release_date'],
              currentMovie['backdrop_path'],
              currentMovie['vote_average'],
            ))
        .toList();
    // _movies = Movies.fromJson(response.data);
  }

  // void whichScreen(int index) {
  //   if (index == 0) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else if (index == 1) {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => ChuckNorrisScreen()));
  //   } else if (index == 2) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => FavouritesScreen()));
  //   }
  // }
// List <>
//   String appbartitle(int index) {
//     var title;
//     if (index == 0) {
//       title = 'Movies';
//     } else if (index == 1) {
//       title = 'Chuck Norris';
//     } else if (index == 2) {
//       title = 'Favourites';
//     }
//     return title;
//   }

  showDetailsOfTheMovie(String title) {
    int index = movie.indexWhere((Movies currentMovie) {
      String currentTitle = currentMovie.title;
      return currentTitle.contains(title);
    });

    if (index != -1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieDetailsPreview(movie[index])));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeMovieData();
  }

  @override
  Widget build(BuildContext context) {
    bool fav = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        centerTitle: true,
      ),
      // backgroundColor: Colors.blueGrey,
      body: FutureBuilder(
        future: Server.getMovies(),
        builder:
            (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasData == true &&
              snapshot.connectionState == ConnectionState.done) {
            // print(movie);
            return GridView.builder(
                itemCount: movie.length,
                // itemCount: _movies!.results.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print('${movie.elementAt(index).title}');
                      showDetailsOfTheMovie(movie.elementAt(index).title);
                    },
                    child: Card(
                      elevation: 15,
                      margin: EdgeInsets.all(5),
                      color: Colors.blueGrey.shade800,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image(
                              image: NetworkImage(Constants.imageurlTMDB +
                                  movie.elementAt(index).backdropPath)),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    movie.elementAt(index).title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            fav = !fav;
                                            print(
                                                'this is your favourite movie$fav');
                                            setState(() {
                                              fav == true
                                                  ? favMovie.favMovieList.add(
                                                      movie.elementAt(index))
                                                  : favMovie.favMovieList
                                                      .remove(movie
                                                          .elementAt(index));
                                            });
                                            print(fav);
                                          },
                                          icon: fav == false
                                              ? Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.white)
                                              : Icon(Icons.favorite,
                                                  color: Colors.red)),
                                      Text(
                                        'Rating: ${movie.elementAt(index).ratings}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Center(
                child: Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
          }
        },
      ),
    );
  }
}
