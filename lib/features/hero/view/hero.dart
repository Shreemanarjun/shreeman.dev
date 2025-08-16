import 'package:jaspr/jaspr.dart';

import 'package:jaspr_lucide/jaspr_lucide.dart' hide text;
import 'package:newportfolio/features/hero/view/view_cv_button.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  void scrollToProjects() {
    web.document.getElementById('projects')?.scrollIntoView({'behavior': 'smooth'}.jsify()!);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      // The main container for the Hero section.
      // - 'min-h-screen flex items-center justify-center': Vertically centers content within the viewport height.
      // - 'relative overflow-hidden': For background elements.
      // - 'pt-12': Adds padding-top for small screens by default.
      // - 'md:pt-0 md:top-0': Removes padding-top and top offset for medium screens (desktop) and up.
      classes: 'min-h-screen flex items-center justify-center relative overflow-hidden pt-12 md:pt-0 md:top-0',
      [
        // Animated Background Elements (no changes here)
        div(classes: 'absolute inset-0', [
          div(
            classes: 'absolute top-20 left-10 w-72 h-84 bg-blue-500/20 rounded-full filter blur-3xl animate-pulse',
            [],
          ),
          div(
            classes: 'absolute bottom-20 right-10 w-96 h-96 bg-purple-500/20 rounded-full filter blur-3xl animate-pulse delay-1000',
            [],
          ),
          div(
            classes: 'absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-pink-500/10 rounded-full filter blur-3xl animate-pulse delay-500',
            [],
          ),
        ]),

        // Main content container (holds the card and floating elements)
        div(
          // 'container mx-auto px-4 text-center relative z-10': Standard container setup.
          // 'mt-14': This provides a default margin-top for very small screens.
          // 'md:mt-0': Resets margin-top for medium screens (desktop) and up, allowing flex centering to dominate.
          classes: 'container mx-auto px-4 text-center relative z-10 mt-12 md:mt-0', // Added md:mt-0
          [
            // The main content card
            div(
              // 'backdrop-blur-lg bg-white/10 ...': Styling for the card.
              // 'p-4 md:p-12': Responsive padding inside the card.
              // 'max-w-4xl mx-auto': Max width and horizontal centering.
              // IMPORTANT CHANGE: Removed 'sm:mt-14' from here!
              classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-3xl p-4 md:p-12 shadow-2xl max-w-4xl mx-auto',
              [
                div(classes: 'space-y-6', [
                  // Profile Image
                  div(classes: 'relative mx-auto w-32 h-32 mb-8', [
                    div(
                      classes: 'w-full h-full bg-gradient-to-br from-blue-400 to-purple-600 rounded-full p-1',
                      [
                        div(classes: 'w-full h-full bg-gray-800 rounded-full flex items-center justify-center text-4xl font-bold text-white', [
                          img(
                            src: 'https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//ChatGPT%20Image%20Jul%2010,%202025,%2001_06_31%20AM%20(convert.io).webp',
                            alt: 'Shreeman Arjun Sahu',
                            classes: 'object-cover w-full h-full rounded-full w-24 h-24 overflow-hidden ',
                          ),
                        ]),
                      ],
                    ),
                  ]),

                  h1(
                    classes: 'text-5xl md:text-7xl font-bold bg-gradient-to-r from-blue-400 via-purple-500 to-pink-500 bg-clip-text text-transparent animate-fade-in',
                    [text('Shreeman Arjun Sahu')],
                  ),

                  p(classes: 'lcp-text', [
                    text(
                      'Crafting beautiful, performant cross-platform applications with ',
                    ),
                    span(classes: 'text-blue-400 font-semibold', [
                      text('Flutter'),
                    ]),
                    text(' and '),
                    span(classes: 'text-purple-400 font-semibold', [
                      text('Dart'),
                    ]),
                    text(' for '),
                    span(classes: 'text-green-400 font-semibold', [
                      text('Android'),
                    ]),
                    text(', '),
                    span(classes: 'text-gray-300 font-semibold', [text('iOS')]),
                    text(', '),
                    span(classes: 'text-blue-300 font-semibold', [
                      text('Windows'),
                    ]),
                    text(', and '),
                    span(classes: 'text-orange-400 font-semibold', [text('Web')]),
                  ]),

                  p(classes: 'text-sm md:text:lg text-white/60 max-w-xl mx-auto', [
                    text(
                      'Passionate about creating seamless user experiences across all platforms with a single codebase. Specializing in modern UI/UX design, scalable architecture, and cross-platform optimization.',
                    ),
                  ]),

                  // CTA Buttons
                  div(classes: 'flex flex-col sm:flex-row gap-4 justify-center mt-8', [
                    button(
                      events: {'click': (_) => scrollToProjects()},
                      classes: 'group px-8 py-4 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full text-white font-semibold hover:from-blue-600 hover:to-purple-700 transition-all duration-300 transform hover:scale-105 hover:shadow-xl',
                      [
                        span(classes: 'flex items-center justify-center gap-2', [
                          text('View My Work'),
                          arrowDown(
                            height: 20.px,
                            width: 20.px,
                            classes: 'group-hover:translate-y-1 transition-transform duration-300',
                          ),
                        ]),
                      ],
                    ),
                    const ViewCV(),
                  ]),
                ]),
              ],
            ),

            // Floating Elements (no changes here)
            div(classes: 'absolute top-12 left-10 opacity-20', [
              div(classes: 'w-4 h-4 bg-blue-400 rounded-full animate-bounce', []),
            ]),
            div(classes: 'absolute bottom-20 left-20 opacity-20', [
              div(
                classes: 'w-6 h-6 bg-purple-400 rounded-full animate-bounce delay-300',
                [],
              ),
            ]),
            div(classes: 'absolute top-20 right-20 opacity-20', [
              div(
                classes: 'w-5 h-5 bg-pink-400 rounded-full animate-bounce delay-700',
                [],
              ),
            ]),
          ],
        ),

        // Scroll Indicator (no changes here)
        div(
          classes: "absolute bottom-[0px] left-1/2 transform -translate-x-1/2 animate-bounce z-10",
          [
            div(
              classes: 'w-6 h-10 border-2 border-white/30 rounded-full flex justify-center',
              [
                div(
                  classes: 'w-1 h-3 bg-white/50 rounded-full mt-3 animate-pulse',
                  [],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
