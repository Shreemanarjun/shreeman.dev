import 'package:jaspr/server.dart';

class CustomText extends StatelessComponent {
  final String data;
  final String classes;

  const CustomText(this.data, {super.key, this.classes = ""});

  @override
  Component build(BuildContext context) {
    return div(classes: classes, [text(data)]);
  }
}
