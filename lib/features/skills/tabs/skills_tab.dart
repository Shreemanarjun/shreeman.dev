// Converted from JSX to Jaspr Dart - Skills Tab Section

import 'dart:async';
import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

class SkillsTab extends StatefulComponent {
  final String activeTab;
  const SkillsTab({required this.activeTab});

  @override
  State<SkillsTab> createState() => SkillsTabState();
}

class SkillsTabState extends State<SkillsTab> {
  final coreSkills = [
    {
      'name': 'Flutter Development',
      'percent': 95,
      'color': 'from-blue-400 to-blue-600',
    },
    {
      'name': 'Dart Programming',
      'percent': 92,
      'color': 'from-green-400 to-green-600',
    },
    {
      'name': 'Cross‑Platform Development',
      'percent': 90,
      'color': 'from-purple-400 to-purple-600',
    },
    {
      'name': 'Mobile UI/UX Design',
      'percent': 88,
      'color': 'from-pink-400 to-pink-600',
    },
    {
      'name': 'State Management',
      'percent': 85,
      'color': 'from-indigo-400 to-indigo-600',
    },
    {
      'name': 'API Integration',
      'percent': 90,
      'color': 'from-cyan-400 to-cyan-600',
    },
    {
      'name': 'Database Management',
      'percent': 82,
      'color': 'from-orange-400 to-orange-600',
    },
    {
      'name': 'Performance Optimization',
      'percent': 87,
      'color': 'from-red-400 to-red-600',
    },
  ];

  final Map<String, int> animatedSkills = {};

  void _animateSkillsNow() async {
    animatedSkills.clear();

    for (var i = 0; i < coreSkills.length; i++) {
      final skill = coreSkills[i];
      Timer(Duration(milliseconds: i * 150), () {
        if (mounted) {
          setState(
            () => animatedSkills[skill['name']! as String] = skill['percent']! as int,
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _animateSkillsNow();
    startAnimation();
  }

  Timer? timer;

  void startAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final element = web.document.querySelector("#Skills");
      if (element != null) {
        timer.cancel();
        element.addEventListener(
          "load",
          () {
            web.console.log("skills loaded".jsify());
            _animateSkillsNow();
          }.toJS,
        );
      } else {
        web.console.log("element not found".jsify());
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final specializations = [
      'Cross-Platform Mobile Development',
      'State Management (Bloc, Provider, Riverpod)',
      'Custom UI/UX Implementation',
      'Performance Optimization',
      'Firebase & Cloud Integration',
      'App Store Deployment',
    ];

    yield div(
      id: "Skills",
      classes:
          'transition-all duration-500 '
          'opacity-100 translate-x-0',
      [
        div(classes: 'grid lg:grid-cols-2 gap-8', [
          div(
            classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
            [
              h3(classes: 'text-2xl font-bold text-white mb-8', [
                text('Core Competencies'),
              ]),
              div(classes: 'space-y-6', [
                for (var i = 0; i < coreSkills.length; i++)
                  div(classes: 'group', [
                    div(classes: 'flex justify-between items-center mb-2', [
                      span(classes: 'text-white font-medium', [
                        text(coreSkills[i]['name'] as String),
                      ]),
                      span(classes: 'text-white/70 text-sm', [
                        text('${animatedSkills[coreSkills[i]['name']] ?? 0}%'),
                      ]),
                    ]),
                    div(classes: 'h-3 bg-white/20 rounded-full overflow-hidden', [
                      div(
                        classes: 'h-full bg-gradient-to-r ${coreSkills[i]['color']} transition-all duration-1000 ease-out rounded-full relative',
                        styles: Styles(
                          raw: {
                            'width': '${animatedSkills[coreSkills[i]['name']] ?? 0}%',
                            'transition-delay': '${i * 150}ms',
                          },
                        ),
                        [
                          div(
                            classes: 'absolute inset-0 bg-white/20 rounded-full animate-pulse',
                            [],
                          ),
                        ],
                      ),
                    ]),
                  ]),
              ]),
            ],
          ),
          div(classes: 'space-y-6', [
            div(
              classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
              [
                h3(classes: 'text-2xl font-bold text-white mb-6', [
                  text('Experience Overview'),
                ]),
                div(classes: 'grid grid-cols-2 gap-6', [
                  for (final data in [
                    {
                      'value': '3+',
                      'label': 'Years Experience',
                      'gradient': 'from-blue-400 to-purple-600',
                    },
                    {
                      'value': '15+',
                      'label': 'Projects Completed',
                      'gradient': 'from-green-400 to-blue-600',
                    },
                    {
                      'value': '1M+',
                      'label': 'App Downloads',
                      'gradient': 'from-purple-400 to-pink-600',
                    },
                    {
                      'value': '4',
                      'label': 'Platforms',
                      'gradient': 'from-cyan-400 to-blue-600',
                    },
                  ])
                    div(
                      classes: 'text-center group hover:bg-white/10 rounded-xl p-4 transition-all duration-300',
                      [
                        div(
                          classes: 'text-4xl font-bold bg-gradient-to-r ${data['gradient']} bg-clip-text text-transparent mb-2 group-hover:scale-110 transition-transform duration-300',
                          [text(data['value']!)],
                        ),
                        div(classes: 'text-white/70 text-sm', [
                          text(data['label']!),
                        ]),
                      ],
                    ),
                ]),
              ],
            ),
            div(
              classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
              [
                h3(classes: 'text-xl font-bold text-white mb-4', [
                  text('Specializations'),
                ]),
                div(classes: 'space-y-3', [
                  for (final specialization in specializations)
                    div(
                      classes: 'flex items-center gap-3 text-white/80 hover:text-white transition-colors duration-300',
                      [
                        div(
                          classes: 'w-2 h-2 bg-gradient-to-r from-green-400 to-blue-600 rounded-full',
                          [],
                        ),
                        span(classes: 'text-sm', [text(specialization)]),
                      ],
                    ),
                ]),
              ],
            ),
          ]),
        ]),
      ],
    );
  }
}
