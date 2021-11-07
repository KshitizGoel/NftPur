import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoriesFeature extends StatefulWidget {
  @override
  _StoriesFeatureState createState() => _StoriesFeatureState();
}

class _StoriesFeatureState extends State<StoriesFeature> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoryView(
          storyItems: [
            StoryItem.inlineProviderImage(
              AssetImage(Assets.nftTrending1),
              caption: _customCaptionTextWidget('Mind Universe'),
            ),
            StoryItem.inlineProviderImage(
              AssetImage(Assets.nftTrending2),
              caption: _customCaptionTextWidget('Cat Nip'),
            ),
            StoryItem.inlineProviderImage(
              AssetImage(Assets.nftTrending3),
              caption: _customCaptionTextWidget('Nigerian Machine'),
            ),
            // StoryItem.pageImage(
            //   url:
            //       "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            //   caption: "Still sampling",
            //   controller: storyController,
            // ),
            // StoryItem.pageImage(
            //     url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            //     caption: "Working with gifs",
            //     controller: storyController),
            // // StoryItem.pageImage(
            // //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            // //   caption: "Hello, from the other side",
            // //   controller: storyController,
            // // ),
            // // StoryItem.pageImage(
            // //   url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            // //   caption: "Hello, from the other side2",
            // //   controller: storyController,
            // // ),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            print("Completed a cycle");
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
        ),
      ),
    );
  }

  Text _customCaptionTextWidget(String text) {
    return Text(
      '$text',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          backgroundColor: Colors.black,
          wordSpacing: 5,
          fontSize: 25),
    );
  }
}
