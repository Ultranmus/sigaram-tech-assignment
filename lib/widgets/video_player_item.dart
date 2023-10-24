import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final int index;
  const VideoPlayerItem(
      {super.key, required this.videoUrl, required this.index});
  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItem();
}

class _VideoPlayerItem extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      showControlsOnInitialize: false,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      showOptions: false,
      placeholder: const Center(
        child: CircularProgressIndicator(),
      ),
      looping: true,
      errorBuilder: (context, errorMessage) {
        return const Center(child: Text('ERROR'));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction == 0.0) {
            _chewieController.pause();
          } else {
            // Widget is partially or fully hidden
            // You can perform actions when it's not fully visible
          }
        },
        key: Key('VideoPlayer${widget.index}'),
        child: Chewie(controller: _chewieController));
  }
}
