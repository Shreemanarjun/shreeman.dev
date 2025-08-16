import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';

import 'package:universal_web/web.dart' as webc; // Import dart:html for DOM manipulation

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer(
      classes: 'py-12 relative overflow-hidden', // Corrected: single string
      [
        // Background Elements
        div(
          classes: 'absolute inset-0', // Corrected: single string
          [
            div(
              classes: 'absolute bottom-[-6rem] left-1/3 w-64 h-64 bg-blue-500/5 rounded-full filter blur-3xl', // Corrected: single string
              [],
            ),
            div(
              classes: 'absolute bottom-[-6rem] right-1/3 w-80 h-80 bg-purple-500/5 rounded-full filter blur-3xl', // Corrected: single string
              [],
            ),
          ],
        ),

        div(
          classes: 'container mx-auto px-6 relative z-10', // Corrected: single string
          [
            div(
              classes: 'max-w-6xl mx-auto', // Corrected: single string
              [
                // Main Footer Content
                div(
                  classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8 mb-8', // Corrected: single string
                  [
                    div(
                      classes: 'grid md:grid-cols-3 gap-8', // Corrected: single string
                      [
                        // Brand Section
                        div([
                          div(
                            classes: 'text-2xl font-bold bg-gradient-to-r from-blue-400 to-purple-600 bg-clip-text text-transparent mb-4', // Corrected: single string
                            [text('FlutterDev')],
                          ),
                          p(
                            classes: 'text-white/70 leading-relaxed', // Corrected: single string
                            [
                              text(
                                'Passionate Flutter developer creating beautiful, performant mobile applications that deliver exceptional user experiences.',
                              ),
                            ],
                          ),
                        ]),

                        // Quick Links
                        div([
                          h4(
                            classes: 'text-lg font-semibold text-white mb-4', // Corrected: single string
                            [text('Quick Links')],
                          ),
                          div(
                            classes: 'space-y-2', // Corrected: single string
                            [
                              for (var item in [
                                'About',
                                'Experience',
                                'Skills',
                                'Projects',
                                'Contact',
                              ])
                                button(
                                  events: {
                                    'click': (e) {
                                      webc.document
                                          .getElementById(item.toLowerCase())
                                          ?.scrollIntoView(
                                            {'behavior': 'smooth'}.jsify()!,
                                          );
                                    },
                                  },
                                  classes: 'block text-white/70 hover:text-white transition-colors duration-300', // Corrected: single string
                                  [text(item)],
                                ),
                            ],
                          ),
                        ]),

                        // Services
                        div([
                          h4(
                            classes: 'text-lg font-semibold text-white mb-4', // Corrected: single string
                            [text('Services')],
                          ),
                          div(
                            classes: 'space-y-2 text-white/70', // Corrected: single string
                            [
                              div([text('Mobile App Development')]),
                              div([text('Cross-Platform Solutions')]),
                              div([text('UI/UX Design')]),
                              div([text('App Store Optimization')]),
                              div([text('Maintenance & Support')]),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),

                // Bottom Section
                div(
                  classes: 'flex flex-col md:flex-row items-center justify-between py-6 border-t border-white/20', // Corrected: single string
                  [
                    div(
                      classes: 'flex items-center gap-2 text-white/70 mb-4 md:mb-0', // Corrected: single string
                      [
                        span([text('Made with')]),
                        // Heart Icon (Lucide-react equivalent SVG)
                        svg(
                          classes: 'w-4 h-4 text-red-400 fill-current animate-pulse', // Corrected: single string
                          attributes: {
                            'xmlns': 'http://www.w3.org/2000/svg',
                            'width': '24',
                            'height': '24',
                            'viewBox': '0 0 24 24',
                            'fill': 'none',
                            'stroke': 'currentColor',
                            'stroke-width': '2',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                          },
                          [
                            path(
                              attributes: {
                                'd': 'M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z',
                              },
                              [],
                            ),
                          ],
                        ),
                        span([text('and')]),
                        // Code Icon (Lucide-react equivalent SVG)
                        svg(
                          classes: 'w-4 h-4 text-blue-400', // Corrected: single string
                          attributes: {
                            'xmlns': 'http://www.w3.org/2000/svg',
                            'width': '24',
                            'height': '24',
                            'viewBox': '0 0 24 24',
                            'fill': 'none',
                            'stroke': 'currentColor',
                            'stroke-width': '2',
                            'stroke-linecap': 'round',
                            'stroke-linejoin': 'round',
                          },
                          [
                            polyline(
                              attributes: {'points': '16 18 22 12 16 6'},
                              [],
                            ),
                            polyline(
                              attributes: {'points': '8 6 2 12 8 18'},
                              [],
                            ),
                          ],
                        ),
                        span([text('by Shreeman Arjun Sahu')]),
                      ],
                    ),
                    div(
                      classes: 'text-white/60 text-sm', // Corrected: single string
                      [
                        text(
                          '© 2025 Shreeman Arjun Sahu. All rights reserved.',
                        ),
                      ],
                    ),
                  ],
                ),

                // Floating CTA
                div(
                  classes: 'text-center mt-8', // Corrected: single string
                  [
                    button(
                      events: {
                        'click': (e) {
                          webc.document.getElementById('contact')?.scrollIntoView({'behavior': 'smooth'}.jsify()!);
                        },
                      },
                      classes:
                          'inline-flex items-center gap-2 px-8 py-4 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full text-white font-semibold hover:from-blue-600 hover:to-purple-700 transition-all duration-300 transform hover:scale-105 hover:shadow-xl', // Corrected: single string
                      [text('Ready to start your project?')],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
