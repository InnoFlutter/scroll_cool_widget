import 'package:flutter/material.dart';
import 'package:scroll_cool_widget/button_position.dart';

class ScrollCoolWidget extends StatefulWidget {
  final Widget Function(int index, double width, double height) createWidget;
  final int countOfCache;
  final double width;
  final double height;
  final Axis scrollDirection;
  final ButtonPosition buttonPosition;
  final Color buttonColor;
  final Color buttonIconColor;

  late double _topPosition;
  late double _leftPosition;

  ScrollCoolWidget({
    Key? key,
    required this.createWidget,
    required this.countOfCache,
    required this.width,
    required this.height,
    this.scrollDirection = Axis.vertical,
    this.buttonPosition = ButtonPosition.none,
    this.buttonColor = Colors.blueAccent,
    this.buttonIconColor = Colors.white,
  }) : super(key: key) {
    switch (buttonPosition) {
      case ButtonPosition.none:
        _topPosition = 0;
        _leftPosition = 0;
        break;
      case ButtonPosition.topLeft:
        _topPosition = 10;
        _leftPosition = 10;
        break;
      case ButtonPosition.topRight:
        _topPosition = 10;
        _leftPosition = width - 65;
        break;
      case ButtonPosition.bottomLeft:
        _topPosition = height - 145;
        _leftPosition = 10;
        break;
      case ButtonPosition.bottomRight:
        _topPosition = height - 145;
        _leftPosition = width - 65;
        break;
    }
  }

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

    return Stack(
      children: [
        PageView(
          controller: _controller,
          scrollDirection: widget.scrollDirection,
          children: cache,
          onPageChanged: (index) {
            setState(() {
              globalIndex += (index - this.index);
              this.index = index;
            });
          },
        ),
        if (widget.buttonPosition != ButtonPosition.none)
          Positioned(
            top: widget._topPosition,
            left: widget._leftPosition,
            child: FloatingActionButton(
              backgroundColor: widget.buttonColor,
              onPressed: () {
                _controller.animateToPage(0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.ease,
                );

                setState(() {
                  index = 0;
                  globalIndex = 0;
                });
              },
              child: Icon(widget.scrollDirection == Axis.vertical ? Icons.arrow_upward : Icons.arrow_back,
                color: widget.buttonIconColor,
              ),
            ),
          ),
      ]
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
