import 'dart:async';

import 'package:f/presentation/main_page/widgets/custom_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../models/story_model.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    required this.stories,
    required this.index,
    super.key
  });

  final List<StoryModel> stories;
  final int index;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final PageController _pageController;
  late final double _storyLineWidth = (MediaQuery.of(context).size.width - 16
      - widget.stories.length * 4) / widget.stories.length;
  late final Timer _timer;
  double _animationWidth = 0;
  int _index = 0;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(seconds: 10),
        vsync: this
    )..addListener(() {
      _animationWidth = _animationController.value * _storyLineWidth;
      setState(() {

      });
    })..forward();
    _pageController = PageController(initialPage: widget.index);
    _timer = Timer(const Duration(seconds: 10), () {
      if(_index == 3) {
        context.pop();
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.stories.length,
            onPageChanged: (value) {
              _animationWidth = 0;
              _index = value;
              _animationController.reset();
              _animationController.forward();
            },
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                tag: widget.stories[index].url,
                child: widget.stories[index].isVideo
                    ? CustomVideo(url: widget.stories[index].url)
                    : Image.network(
                    widget.stories[index].url,
                    fit: BoxFit.cover
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 8,
            right: 8,
            child: Row(
              children: [
                for(int i = 0; i < widget.stories.length; i++)
                    Stack(
                      children: [
                        Container(
                          height: 5,
                          width: _storyLineWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey
                          ),
                        ),
                        Container(
                          height: 5,
                          width: _index == i ? _animationWidth : _index > i ? _storyLineWidth : 0,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child:
                GestureDetector(onTap: () {
                  if(_index == 0) {
                    context.pop();
                  } else {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.ease
                    );
                  }
                },
                  child: Container(color: Colors.transparent),
                ),
              ),
              Expanded(
                child: GestureDetector(onTap: () {
                  if(_index == 2) {
                    context.pop();
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.ease
                    );
                  }
                },
                  child: Container(color: Colors.transparent),
                ),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).padding.top + 25,
              right: 10,
              child: GestureDetector(onTap: () {
                context.pop();
              },
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              )
          ),
        ],
      ),
    );
  }
}
