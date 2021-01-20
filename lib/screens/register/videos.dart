import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/utills/imports.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  static String id = '/Videos';

  @override
  VideosState createState() => VideosState();
}

class VideosState extends State<Videos> {
  List<String> videoList;
  var systemTempDir;

  Future<String> getDir() async {
    print('sdfgsdfgsdadsasdfasdfasdfasdfasdff');
    return await ExtStorage.getExternalStorageDirectory();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: getDir(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print('adf ${snapshot.data}');
            systemTempDir = Directory(snapshot.data);
            print("adfad ${systemTempDir}");
            systemTempDir
                .list(recursive: true, followLinks: false)
                .listen((FileSystemEntity entity) {
              print("check: ${entity.path}");
            });

            final List videoList = systemTempDir
                .listSync()
                .map((item) => item.path)
                .where((item) =>
                    item.endsWith(".mp4") ||
                    item.endsWith(".avi") ||
                    item.endsWith(".webm"))
                .toList(growable: false);

            print("videoList: ${videoList.length}");
            print("path: ${systemTempDir.path}");

            return ListView.builder(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 16),
                itemCount: videoList.length,
                itemBuilder: (BuildContext _context, int index) {
                  if (index >= videoList.length) {
                    return null;
                  }
                  return VideoPlayerScreen(
                    path: videoList[index],
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String path;

  VideoPlayerScreen({Key key, @required this.path}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(
        path: this.path,
      );
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFeature;
  final String path;

  _VideoPlayerScreenState({Key key, @required this.path});

  @override
  void initState() {
    _controller = VideoPlayerController.file(File(path));
    _initializeVideoPlayerFeature = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: FutureBuilder(
            future: _initializeVideoPlayerFeature,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
}
