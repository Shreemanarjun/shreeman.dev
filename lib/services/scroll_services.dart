import 'package:universal_web/web.dart';

class ScrollService {
  void scrollToSection(String sectionId) {
    final element = document.getElementById(sectionId);
    if (element != null) {
      element.scrollIntoView(ScrollIntoViewOptions(behavior: 'smooth'));
    }
  }
}
