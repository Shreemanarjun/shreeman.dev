import 'dart:async';
import 'dart:js_interop' as js;
import 'package:jaspr/jaspr.dart' hide code;
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:newportfolio/features/skills/tabs/skills_tab.dart';
import 'package:newportfolio/features/skills/tabs/technology_tab.dart';
import 'package:universal_web/web.dart' as webc;

class Skills extends StatefulComponent {
  const Skills({super.key});

  @override
  State<Skills> createState() => SkillsState();
}

class SkillsState extends State<Skills> {
  bool isVisible = true;
  String activeTab = 'skills';
  bool animateSkills = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final el = webc.document.getElementById('skills');
      if (el != null) {
        timer.cancel();
        webc.IntersectionObserver(
          ((
                JSArray<webc.IntersectionObserverEntry> entries,
                webc.IntersectionObserver observer,
              ) {
                final entry = entries[0];
                if (entry.isIntersecting == true && mounted && !isVisible) {
                  setState(() => isVisible = true);
                  if (activeTab == 'skills') {
                    animateSkillsTab();
                  }
                }
              })
              .toJS,
          webc.IntersectionObserverInit(threshold: [0.1].toJSDeep),
        ).observe(el);
      }
    });
  }

  void animateSkillsTab() {
    setState(() => animateSkills = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Component build(BuildContext ctx) {
    return section(id: 'skills', classes: 'py-20 relative overflow-hidden', [
      // Background
      div(classes: 'absolute inset-0', [
        div(
          classes: 'absolute top-1/4 right-10 w-72 h-72 bg-green-500/10 rounded-full filter blur-3xl',
          [],
        ),
        div(
          classes: 'absolute bottom-1/4 left-10 w-96 h-96 bg-blue-500/10 rounded-full filter blur-3xl',
          [],
        ),
      ]),

      div(classes: 'container mx-auto px-6 relative z-10', [
        div(classes: 'max-w-6xl mx-auto', [
          // Title
          div(
            classes:
                '''
            text-center mb-16 transition-all duration-1000 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}
          ''',
            [
              h2(
                classes: 'text-4xl md:text-5xl font-bold bg-gradient-to-r from-green-400 to-blue-600 bg-clip-text text-transparent mb-6',
                [text('Skills & Expertise')],
              ),
              p(
                classes: 'text-xl text-white/80 max-w-3xl mx-auto leading-relaxed',
                [text('Technologies and tools I use to bring ideas to life')],
              ),
            ],
          ),

          // Tabs
          div(
            classes:
                '''
            flex justify-center mb-12 transition-all duration-1000 delay-300 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}
          ''',
            [
              div(
                classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-2',
                [
                  div(classes: 'flex gap-2', [
                    button(
                      classes: 'flex-1 px-8 py-4 rounded-xl font-semibold ${activeTab == 'skills' ? 'bg-gradient-to-r from-green-500 to-blue-600 text-white shadow-lg' : 'text-white/80 hover:text-white hover:bg-white/10'}',
                      events: {
                        'click': (_) {
                          setState(() {
                            activeTab = 'skills';
                            animateSkillsTab();
                          });
                        },
                        'load': (_) {
                          animateSkillsTab();
                        },
                      },
                      [text('Core Skills')],
                    ),
                    button(
                      classes: 'flex-1 px-8 py-4 rounded-xl font-semibold ${activeTab == 'technologies' ? 'bg-gradient-to-r from-green-500 to-blue-600 text-white shadow-lg' : 'text-white/80 hover:text-white hover:bg-white/10'}',
                      events: {
                        'click': (_) => setState(() => activeTab = 'technologies'),
                      },
                      [text('Technologies')],
                    ),
                  ]),
                ],
              ),
            ],
          ),

          // Content
          div(classes: 'relative min-h-[400px]', [
            // Skills tab view
            if (activeTab == 'skills') const SkillsTab(activeTab: 'skills'),

            // Technologies tab view
            if (activeTab == 'technologies') const TechnologyTab(),
          ]),
        ]),
      ]),
    ]);
  }
}
