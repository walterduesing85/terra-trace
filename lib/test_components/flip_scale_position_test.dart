import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final Duration animationDuration; // Optional: Customize animation duration

  const FlipCard({
    required this.front,
    required this.back,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
      _controller!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedSwitcher(
        duration: widget.animationDuration,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: Transform(
          transform: Matrix4.identity()..scale(_isFlipped ? 2 : 1),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: _isFlipped ? _animation!.value * 50 : 0.0,
                child: widget.front,
              ),
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: _isFlipped ? 0.0 : _animation!.value * 50.0,
                child: widget.back,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
