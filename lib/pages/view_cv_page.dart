import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Text, Component, Router;

class ViewCvPage extends StatefulComponent {
  @override
  State createState() => ViewCvPageState();
}

class ViewCvPageState extends State<ViewCvPage> {
  bool showPdf = false;

  final resumeLink =
      'https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//Shreeman-Arjun-Sahu-FlowCV-Resume-20250716.pdf';
  late final JSFunction scrollCallback;
  @override
  void initState() {
    super.initState();

    final currentPath = web.window.location.pathname;
    showPdf = currentPath == '/cv';
    scrollCallback = (() {
      scrollListen(web.document.querySelector('#pdf-wrapper')!);

      // web.console.log("scrolled".jsify());
    }).toJS;

    JSFunction animationListener = (() {
      final wrapper = web.document.querySelector('#pdf-wrapper');
      wrapper?.addEventListener('scroll', scrollCallback);
    }).toJS;
    // Add scroll listener on the container
    web.window.requestAnimationFrame(animationListener);
  }

  void scrollListen(web.Element wrapper) {
    final el = wrapper;
    final scrollTop = el.scrollTop;
    final scrollHeight = el.scrollHeight;
    final clientHeight = el.clientHeight;

    final scrolledToBottom = scrollTop + clientHeight >= scrollHeight - 50;

    if (scrolledToBottom) {
      web.window.history.pushState(null, '', '/');
      setState(() {
        showPdf = false;
      });
    }
  }

  @override
  void dispose() {
    final wrapper = web.document.querySelector('#pdf-wrapper');
    if (wrapper != null) {
      wrapper.removeEventListener('scroll', scrollCallback);
    }
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          'fixed inset-0 flex items-center justify-center z-50 bg-black/60 backdrop-blur-md transition-opacity duration-300',
      [
        // Modal card wrapper
        div(
          id: 'pdf-wrapper',
          classes: """ relative
    w-[95vw] h-[85vh]
    sm:w-[90vw] sm:h-[80vh]
    md:w-[80vw] md:h-[75vh]
    lg:w-[70vw] lg:h-[80vh]
    xl:w-[60vw] xl:h-[85vh]
    bg-white/10 backdrop-blur-xl rounded-2xl shadow-2xl border border-white/20
    overflow-hidden animate-fade-in-up """,
          [
            // ❌ Close button
            button(
              events: {
                'click': (_) {
                  Router.of(context).back();
                },
              },
              classes:
                  'absolute top-3 right-3 bg-black/60 hover:bg-black/80 text-white p-2 rounded-full transition shadow-lg z-10',
              [
                X(height: 20.px, width: 20.px),
              ],
            ),

            div(classes: 'w-full h-full', [
              iframe(
                src: '$resumeLink#toolbar=0&navpanes=0&scrollbar=0',
                attributes: {'width': '100%', 'height': '100%'},
                classes: 'border-none',
                [],
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
