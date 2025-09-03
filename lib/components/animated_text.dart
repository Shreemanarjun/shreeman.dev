import 'dart:async';

import 'package:jaspr/jaspr.dart';

@client
class AnimatedText extends StatefulComponent {
  final String text;
  final String className;
  final int delay;

  const AnimatedText({
    this.text = '',
    this.className = '',
    this.delay = 0,
    super.key,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  String _displayText = '';
  Timer? _delayTimer;
  Timer? _textInterval;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateComponent(AnimatedText oldComponent) {
    super.didUpdateComponent(oldComponent);
    if (oldComponent.text != component.text || oldComponent.delay != component.delay) {
      _resetAndStartAnimation();
    }
  }

  void _startAnimation() {
    _delayTimer = Timer(Duration(milliseconds: component.delay), () {
      if (!mounted) return;
      int currentIndex = 0;
      _textInterval = Timer.periodic(const Duration(milliseconds: 100), (
        timer,
      ) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        if (currentIndex <= component.text.length) {
          setState(() {
            _displayText = component.text.substring(0, currentIndex);
          });
          currentIndex++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resetAndStartAnimation() {
    _cleanupTimers();
    setState(() => _displayText = '');
    _startAnimation();
  }

  void _cleanupTimers() {
    _delayTimer?.cancel();
    _textInterval?.cancel();
  }

  @override
  void dispose() {
    _cleanupTimers();
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return span(classes: component.className, [
      RawText(_displayText),
      span(classes: 'animate-pulse', [text('|')]),
    ]);
  }
}
