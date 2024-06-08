import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (value) {
              _index = value;
            },
            itemBuilder: (BuildContext context, int index) {
              return Hero(
                tag: 'story',
                child: Image.network('https://firebasest'
                    'orage.googleapis.com/v0/b/pleasureclub-4d7ee.appspot.com/o/'
                    '2024-05-31%2021.25.39.jpg?alt=media&tok'
                    'en=5887fd17-847a-4ca4-962f-2953bd3903b3',
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
                for(int i = 0; i<3; i++)
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey
                      ),
                    ),
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
                  child: Container(
                    color: Colors.transparent,
                  ),
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
                  child: Container(
                    color: Colors.transparent,
                  ),
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
