import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../firebase.dart';
import '../models/video_item.dart';
import '../widgets/keep_alive_page.dart';
import '../widgets/video_player_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final dataList = [
    //   VideoItem(title: 'Hello World. Testing Video 1', link: 'https://www.youtube.com/watch?v=Htq4yLQRn00'),
    //   VideoItem(title: 'Hello World Testing Video #2', link: 'https://www.youtube.com/watch?v=R2siu6lc9C4'),
    //   VideoItem(title: 'Hello World Testing Video #3', link: 'https://www.youtube.com/watch?v=ZidUzpou4kI'),
    //   // Add more VideoItem objects as needed
    // ];
    // ref.read(firebaseProvider).saveDataToFirestore(dataList);

    return FutureBuilder<List<VideoItem>>(
        future: ref.read(firebaseProvider).fetchVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          } else {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return KeepAlivePage(
                    widget: VideoPlayerItem(
                  videoUrl: snapshot.data![index].link,
                  index: index,
                ));
              },
            );
          }
        });
  }
}
