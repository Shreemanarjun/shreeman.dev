import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide text, component;
import 'package:jaspr_router/jaspr_router.dart';

import 'package:universal_web/web.dart' as web;

class ViewCV extends StatefulComponent {
  final bool isToShowCv;
  const ViewCV({super.key, this.isToShowCv = false});
  @override
  State createState() => ViewCVState();
}

class ViewCVState extends State<ViewCV> {
  bool isMobile() {
    final userAgent = web.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('iphone') || userAgent.contains('android') || userAgent.contains('ipad') || web.window.innerWidth < 768;
  }

  final resumeLink = 'https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//Shreeman-Arjun-Sahu-FlowCV-Resume-20250716.pdf';
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // 🟢 Action Button
    yield a(
      href: '#',
      events: {
        'click': (e) {
          e.preventDefault();
          if (isMobile()) {
            web.window.open(
              resumeLink,
              '_blank',
              'menubar=no,toolbar=no,scrollbars=yes',
            );
          } else {
            Router.of(context).push('/cv');
          }
        },
      },
      classes: 'group px-8 py-4 backdrop-blur-md bg-white/10 border border-white/30 rounded-full text-white font-semibold hover:bg-white/20 transition-all duration-300 transform hover:scale-105',
      [
        span(classes: 'flex items-center justify-center gap-2', [
          download(
            height: 20.px,
            width: 20.px,
            classes: 'group-hover:translate-y-1 transition-transform duration-300',
          ),
          text('View CV'),
        ]),
      ],
    );
  }
}
