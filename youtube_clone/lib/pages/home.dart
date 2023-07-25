import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:youtube_clone/pages/player.dart';
import 'package:youtube_clone/services/api_client.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiClient.getVideos(),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapShot) {
          if (!snapShot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapShot.hasError) {
            return const Center(child: Text('Something is wrong'));
          } else {
            print('data coming');

            return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (c, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) =>
                                    Player(snapShot.data[index]['id'])));
                          },
                          child: Image.network(snapShot.data[index]['snippet']
                              ['thumbnails']['high']['url']),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              snapShot.data[index]['snippet']['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ))
                            //stack overflow has the text is large
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Row(
                            children: [
                              Text(Numeral(int.parse(snapShot.data[index]
                                      ['statistics']['viewCount']))
                                  .format()),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(timeAgo.format(DateTime.parse(snapShot
                                  .data[index]['snippet']['publishedAt']
                                  .toString())))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        });
  }
}
