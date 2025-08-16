import 'package:jaspr/server.dart';

class AnimatedBg extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: "fixed inset-0 overflow-hidden pointer-events-none", [
      div(
        classes: "absolute -top-1/2 -left-1/2 w-full h-full bg-gradient-to-br from-blue-500/20 to-transparent rounded-full animate-spin-slow",
        [],
      ),
      div(
        classes: "absolute -bottom-1/2 -right-1/2 w-full h-full bg-gradient-to-tl from-purple-500/20 to-transparent rounded-full animate-spin-slow",
        [],
      ),
    ]);
  }
}
