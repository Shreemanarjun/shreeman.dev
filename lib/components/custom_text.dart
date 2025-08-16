import 'package:jaspr/server.dart';

class CustomText extends StatelessComponent {
  final String data;
  final String classes;

  const CustomText(this.data, {super.key, this.classes = ""});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: classes, [text(data)]);
  }
}
