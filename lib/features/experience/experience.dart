import 'dart:js_interop' as web;
import 'dart:async';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Section, Text, Timer, Component;
import 'package:js_interop_utils/js_interop_utils.dart';

import 'package:newportfolio/features/experience/work_experience.dart';
import 'package:universal_web/web.dart' as webc;

class Experience extends StatefulComponent {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool isVisible = false;
  String activeTab = 'work';
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // Set isVisible to true after a short delay to ensure animations work
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        observer();
      }
    });
  }

  void observer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final element = webc.document.getElementById('experience');
      if (element != null) {
        timer.cancel();

        final observer = webc.IntersectionObserver(
          ((
                web.JSArray<webc.IntersectionObserverEntry> entries,
                webc.IntersectionObserver observer,
              ) {
                final entry = entries[0];
                if (entry.isIntersecting && mounted) {
                  setState(() => isVisible = true);
                } else {
                  isVisible = false;
                }
              })
              .toJS,
          webc.IntersectionObserverInit(
            threshold: [0.1].toJSDeep,
            rootMargin: '50px',
          ),
        );
        observer.observe(element);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return section(
      id: 'experience',
      classes: 'py-20 relative overflow-hidden',
      events: {
        "ready": (e) {
          Future.delayed(const Duration(milliseconds: 10), () {
            observer();
          });
        },
      },
      [
        // Background Elements
        div(classes: 'absolute inset-0', [
          div(
            classes: 'absolute top-1/4 left-10 w-80 h-80 bg-emerald-500/10 rounded-full filter blur-3xl',
            [],
          ),
          div(
            classes: 'absolute bottom-1/4 right-10 w-96 h-96 bg-cyan-500/10 rounded-full filter blur-3xl',
            [],
          ),
        ]),

        div(classes: 'container mx-auto px-6 relative z-10', [
          div(classes: 'max-w-6xl mx-auto', [
            // Header
            div(
              classes: 'text-center mb-16 transition-all duration-1000 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                h2(
                  classes: 'text-4xl md:text-5xl font-bold bg-gradient-to-r from-emerald-400 to-cyan-600 bg-clip-text text-transparent mb-6',
                  [text('Experience & Education')],
                ),
                p(
                  classes: 'text-xl text-white/80 max-w-3xl mx-auto leading-relaxed',
                  [
                    text(
                      'My journey in Flutter development and continuous learning',
                    ),
                  ],
                ),
              ],
            ),

            // Tab Navigation
            div(
              classes: 'flex justify-center mb-12 transition-all duration-1000 delay-300 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                div(
                  classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-2',
                  [
                    div(classes: 'flex gap-2', [
                      button(
                        classes:
                            'flex items-center gap-3 px-8 py-4 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 ${activeTab == 'work' ? 'bg-gradient-to-r from-emerald-500 to-cyan-600 text-white shadow-lg' : 'text-white/80 hover:text-white hover:bg-white/10'}',
                        events: {
                          "click": (e) => setState(() => activeTab = 'work'),
                        },
                        [
                          Briefcase(classes: 'w-5 h-5'),
                          text('Work Experience'),
                        ],
                      ),
                      button(
                        classes:
                            'flex items-center gap-3 px-8 py-4 rounded-xl font-semibold transition-all duration-300 transform hover:scale-105 ${activeTab == 'education' ? 'bg-gradient-to-r from-emerald-500 to-cyan-600 text-white shadow-lg' : 'text-white/80 hover:text-white hover:bg-white/10'}',
                        events: {
                          "click": (e) => setState(() => activeTab = 'education'),
                        },
                        [
                          GraduationCap(classes: 'w-5 h-5'),
                          text('Education'),
                        ],
                      ),
                    ]),
                  ],
                ),
              ],
            ),
            WorkExperience(activeTab: activeTab, isVisible: isVisible),
          ]),
        ]),
      ],
    );
  }
}
