import 'package:flutter/material.dart';
import 'package:mapp/screens/chucknorrisscreens/chucknorriscreen.dart';
import 'package:mapp/screens/favouritescreens/favouritescreen.dart';
// import '/utils/server.dart';
// import '/models/movie.dart';
import 'moviescreens/moviescreen.dart';
// import 'chucknorriscreen.dart';
// import 'favouritescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
//   List<Movies> _movie = [];
//   // Movies? _movies;
//   storemoviedata() async {
//     Response<dynamic> response = await Server.getMovies();
//     Map<String, dynamic> map = response.data;
//     List<dynamic> list = map['results'];
//     _movie = list
//         .map((dynamic currentMovie) => new Movies(
//             currentMovie['title'],
//             currentMovie['overview'],
//             currentMovie['posterPath'],
//             currentMovie['releaseDate']))
//         .toList();
//     // _movies = Movies.fromJson(response.data);
//   }
//
//   // void whichScreen(int index) {
//   //   if (index == 0) {
//   //     Navigator.push(
//   //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
//   //   } else if (index == 1) {
//   //     Navigator.push(context,
//   //         MaterialPageRoute(builder: (context) => ChuckNorrisScreen()));
//   //   } else if (index == 2) {
//   //     Navigator.push(
//   //         context, MaterialPageRoute(builder: (context) => FavouritesScreen()));
//   //   }
//   // }
// // List <>
// //   String appbartitle(int index) {
// //     var title;
// //     if (index == 0) {
// //       title = 'Movies';
// //     } else if (index == 1) {
// //       title = 'Chuck Norris';
// //     } else if (index == 2) {
// //       title = 'Favourites';
// //     }
// //     return title;
// //   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     storemoviedata();
//   }

  @override
  Widget build(BuildContext context) {
    List<Widget> navViews = [
      MoviesScreen(),
      ChuckNorrisScreen(),
      FavouritesScreen(),
    ];
    return Scaffold(
      // body: FutureBuilder(
      //   future: Server.getMovies(),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
      //     if (snapshot.hasData == true &&
      //         snapshot.connectionState == ConnectionState.done) {
      //       print(snapshot.data);
      //       return GridView.builder(
      //           itemCount: _movies!.results.length,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //           ),
      //           itemBuilder: (BuildContext context, int index) {
      //             return Card(
      //               color: Colors.white,
      //               child: Center(
      //                 child: Text(_movies!.results[index].title),
      //               ),
      //             );
      //           });
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text(
      //           "Some Error Occurred",
      //           // style: TextStyle(fontWeight: FontWeight.bold),
      //         ),
      //       );
      //     } else {
      //       return Center(
      //           child: Text(
      //         'Loading...',
      //       ));
      //     }
      //   },
      // ),
      body: navViews[_selectedIndex],
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.deepOrangeAccent,
        iconSize: 25,
        showSelectedLabels: false,
        selectedIconTheme:
            IconThemeData(color: Colors.blueGrey.shade700, size: 35),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.theater_comedy), label: 'Chuck Norris'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            // whichScreen(index);
          });
        },
      ),
    );
  }
}
