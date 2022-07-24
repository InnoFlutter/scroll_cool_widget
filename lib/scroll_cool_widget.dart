import 'package:flutter/material.dart';

class ScrollCoolWidget extends StatefulWidget {
  final Widget Function(int index, double width, double height) createWidget;
  final int countOfCache;
  final double width;
  final double height;

  const ScrollCoolWidget({
    Key? key,
    required this.createWidget,
    required this.countOfCache,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<ScrollCoolWidget> createState() => _ScrollCoolWidgetState();
}

class _ScrollCoolWidgetState extends State<ScrollCoolWidget> {
  bool wasInit = false;

  List<Widget> cache = [];
  int index = 0;
  int globalIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    _updateWidgets();

    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: cache,
      onPageChanged: (index) {
        setState(() {
          globalIndex += (index - this.index);
          this.index = index;
        });
      },
    );
  }

  _updateWidgets() {
    if (!wasInit) {
      for (int i = 0; i <= widget.countOfCache + 1; i++) {
        cache.add(widget.createWidget(i, widget.height, widget.width));
      }
      wasInit = true;
    }

    _clearWidgets();
    _addWidgets();
  }

  _addWidgets() {
    if (cache.length - index < widget.countOfCache + 1) {
      setState(() {
        cache.add(widget.createWidget(globalIndex + widget.countOfCache, widget.width, widget.height));
      });
    }
  }

  _clearWidgets() {
    if (cache.length - index > widget.countOfCache + 1) {
      setState(() {
        cache.removeAt(cache.length - 1);
      });
    }
  }
}
