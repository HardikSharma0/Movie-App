import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapp/screens/moviescreens/posterscreen.dart';
import 'package:mapp/utils/constants.dart';

class MovieDetailsPreview extends StatelessWidget {
  final movieObject;

  const MovieDetailsPreview(this.movieObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = 0;
    showPoster(String url) {
      Navigator.push(
          context, MaterialPageRoute(builder: (cntx) => PosterScreen(url)));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.share_outlined,
          color: Colors.blueGrey.shade700,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      // appBar: AppBar(
      //   backgroundColor: Colors.black12,
      //   elevation: 0,
      // ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showPoster(
                    Constants.imageurlTMDB + this.movieObject.posterPath);
                print(Constants.imageurlTMDB + this.movieObject.posterPath);
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: NetworkImage(
                        Constants.imageurlTMDB + this.movieObject.backdropPath),
                  ),
                  Container(
                    color: Colors.black38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // MaterialButton(
                        //   onPressed: () {},
                        //   color: Colors.transparent,
                        //
                        //   child: Icon(
                        //     Icons.favorite_border,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        IconButton(
                            onPressed: () {
                              a = 2;
                            },
                            icon: a == 1
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  )),
                        Text(
                          'Ratings: ${this.movieObject.ratings}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  this.movieObject.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 4,
                    wordSpacing: 5,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 18),
              child: Text(
                this.movieObject.overview,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 18),
              child: Text(
                'Release Date: ${this.movieObject.releaseDate}',
                // textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1,
                  wordSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
