import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mapp/models/chuckNorris.dart';
import 'package:mapp/utils/server.dart';

class ChuckNorrisScreen extends StatefulWidget {
  const ChuckNorrisScreen({Key? key}) : super(key: key);

  @override
  State<ChuckNorrisScreen> createState() => _ChuckNorrisScreenState();
}

class _ChuckNorrisScreenState extends State<ChuckNorrisScreen> {
  late ChuckNorris norris;
  storeNorrisJokes() async {
    Response<dynamic> response = await Server.getChuckNorris();
    print(norris);
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    norris = storeNorrisJokes();
    print(norris);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Server.getChuckNorris(),
        builder:
            (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasData == true &&
              snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: () async {
                print('On refresh');
                return Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    storeNorrisJokes();
                  });
                });
              },
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  print(norris);
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(6),
                      child: ListTile(
                        title: Text(norris.value),
                        leading: Image.network(norris.iconUrl),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                      ));
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Some Error Occurred',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Loading...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
