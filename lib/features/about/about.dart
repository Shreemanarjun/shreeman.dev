import 'dart:async';
import 'dart:js_interop' as web;

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide section, text, code;
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:universal_web/web.dart' as webc;

class About extends StatefulComponent {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isVisible = false;
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
    webc.console.log("Observer started".jsify());

    // Use a timer to ensure the element exists
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final element = webc.document.getElementById('about');
      if (element != null) {
        timer.cancel();
        webc.console.log("Element found, setting up observer".toJSDeep);

        final observer = webc.IntersectionObserver(
          ((
                web.JSArray<webc.IntersectionObserverEntry> entries,
                webc.IntersectionObserver observer,
              ) {
                webc.console.log("Observer callback triggered".toJSDeep);
                final entry = entries[0];
                webc.console.log(
                  "Entry intersecting: ${entry.isIntersecting}".toJSDeep,
                );

                if (entry.isIntersecting && mounted) {
                  setState(() => isVisible = true);
                  webc.console.log("isVisible set to true".toJSDeep);
                }

                // else {
                //   setState(() => isVisible = false);
                //   webc.console.log("isVisible set to false".toJSDeep);
                // }
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
    super.dispose();
    timer?.cancel();
  }

  final features = [
    (
      icon: code([]),
      title: "Clean Code",
      description: "Writing maintainable, scalable code following best practices and design patterns.",
    ),
    (
      icon: smartphone(),
      title: "Cross-Platform",
      description: "Single codebase for both iOS and Android with native performance.",
    ),
    (
      icon: layers(),
      title: "Modern UI",
      description: "Creating beautiful, responsive interfaces with Material Design and Cupertino.",
    ),
    (
      icon: zap(),
      title: "Performance",
      description: "Optimizing apps for speed, efficiency, and excellent user experience.",
    ),
  ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'about',
      classes: 'py-20 relative overflow-hidden',
      events: {
        "onReady": (e) {
          observer();
        },
      },
      [
        // Background Elements
        div(classes: 'absolute inset-0', [
          div(
            classes: 'absolute top-0 left-1/4 w-64 h-64 bg-blue-500/10 rounded-full filter blur-3xl',
            [],
          ),
          div(
            classes: 'absolute bottom-0 right-1/4 w-80 h-80 bg-purple-500/10 rounded-full filter blur-3xl',
            [],
          ),
        ]),
        div(classes: 'container mx-auto px-6 relative z-10', [
          div(classes: 'max-w-6xl mx-auto', [
            div(
              classes: 'text-center mb-16 transition-all duration-1000 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                h2(
                  classes: 'text-4xl md:text-5xl font-bold bg-gradient-to-r from-blue-400 to-purple-600 bg-clip-text text-transparent mb-6',
                  [text('About Me')],
                ),
                p(
                  classes: 'text-xl text-white/80 max-w-3xl mx-auto leading-relaxed',
                  [
                    text(
                      "I'm a passionate Flutter developer with 3+ years of experience building high-quality mobile applications. I love turning ideas into beautiful, functional apps that users enjoy.",
                    ),
                  ],
                ),
              ],
            ),
            div(classes: 'grid md:grid-cols-2 gap-12 items-center', [
              // Left Column
              div(
                classes: 'space-y-6 transition-all duration-1000 delay-300 ${isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-10'}',
                [
                  div(
                    classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
                    [
                      h3(classes: 'text-2xl font-bold text-white mb-4', [
                        text('My Journey'),
                      ]),
                      p(classes: 'text-white/70 leading-relaxed mb-4', [
                        text(
                          "Started my development journey with native Android and iOS development, then discovered Flutter and fell in love with its efficiency and cross-platform capabilities.",
                        ),
                      ]),
                      p(classes: 'text-white/70 leading-relaxed', [
                        text(
                          "I've worked on various projects ranging from e-commerce apps to productivity tools across Android, iOS, Windows, and Web platforms, always focusing on creating exceptional user experiences with clean, maintainable code.",
                        ),
                      ]),
                    ],
                  ),
                  div(
                    classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-6',
                    [
                      h4(classes: 'text-lg font-semibold text-white mb-3', [
                        text('Key Achievements'),
                      ]),
                      ul(classes: 'space-y-2 text-white/70', [
                        li([
                          text(
                            '• 15+ cross-platform applications deployed (Android, iOS, Web, Windows)',
                          ),
                        ]),
                        li([
                          text(
                            '• 1M+ combined app downloads across all platforms',
                          ),
                        ]),
                        li([
                          text(
                            '• Expertise in state management (Bloc, Provider, Riverpod)',
                          ),
                        ]),
                        li([
                          text(
                            '• Firebase & cloud services integration specialist',
                          ),
                        ]),
                      ]),
                    ],
                  ),
                ],
              ),
              // Right Column
              div(
                classes: 'transition-all duration-1000 delay-500 ${isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 translate-x-10'}',
                [
                  div(classes: 'grid grid-cols-1 sm:grid-cols-2 gap-6', [
                    for (var i = 0; i < features.length; i++)
                      div(
                        id: 'feature-$i',
                        classes: 'group backdrop-blur-lg bg-white/10 border border-white/20 rounded-xl p-6 hover:bg-white/20 transition-all duration-300 transform hover:scale-105 hover:shadow-xl',
                        [
                          div(
                            classes: 'text-blue-400 mb-4 group-hover:scale-110 transition-transform duration-300',
                            [
                              div(classes: 'w-8 h-8', [features[i].icon]),
                            ],
                          ),
                          h4(classes: 'text-lg font-semibold text-white mb-2', [
                            text(features[i].title),
                          ]),
                          p(classes: 'text-white/70 text-sm leading-relaxed', [
                            text(features[i].description),
                          ]),
                        ],
                      ),
                  ]),
                ],
              ),
            ]),
          ]),
        ]),
      ],
    );
  }
}
