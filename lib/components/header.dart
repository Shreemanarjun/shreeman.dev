import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Component;
import 'package:newportfolio/components/logo_component.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

final isScrolledProvider = StateProvider<bool>((ref) => false);
final isMobileMenuOpenProvider = StateProvider<bool>((ref) => false);

class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late final JSFunction scrollCallback;
  @override
  void initState() {
    super.initState();

    scrollCallback = (() {
      final scrolled = web.window.scrollY > 100;
      context.read(isScrolledProvider.notifier).state = scrolled;
      // web.console.log("scrolled".jsify());
    }).toJS;

    web.window.addEventListener('scroll', scrollCallback);
  }

  @override
  void dispose() {
    web.window.removeEventListener('scroll', scrollCallback);
    super.dispose();
  }

  void scrollToSection(String id) {
    web.document
        .getElementById(id)
        ?.scrollIntoView(
          {
            'behavior': 'smooth',
            'block': 'start',
            'inline': 'nearest',
          }.jsify()!,
        );

    context.read(isMobileMenuOpenProvider.notifier).state = false;
  }

  @override
  Component build(BuildContext context) {
    final navItems = [
      'About',
      'Projects',
      'Experience',
      'Skills',
      'Contact',
    ];
    final isScrolled = context.watch(isScrolledProvider);
    final isMobileMenuOpen = context.watch(isMobileMenuOpenProvider);
    return div([
      header(
        classes: 'fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${isScrolled ? 'backdrop-blur-md bg-white/10 border-b border-white/20' : 'bg-transparent'}',
        [
          nav(classes: 'container mx-auto px-2 py-4', [
            div(classes: 'flex items-center justify-between', [
              const LogoComponent(),

              // Desktop nav
              div(classes: 'hidden md:flex items-center space-x-8', [
                for (var item in navItems)
                  a(
                    href: '#${item.toLowerCase()}',
                    events: {
                      'click': (e) {
                        e.preventDefault();
                        scrollToSection(item.toLowerCase());
                      },
                    },
                    classes: 'text-white/80 hover:text-white transition-colors duration-300 relative group',
                    [
                      text(item),
                      span(
                        classes: 'absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-600 group-hover:w-full transition-all duration-300',
                        [],
                      ),
                    ],
                  ),
              ]),

              // Desktop social
              div(classes: 'hidden md:flex items-center space-x-4', [
                a(
                  href: 'https://github.com/Shreemanarjun',
                  classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                  [Github(height: 20.px, width: 20.px)],
                ),
                a(
                  href: 'https://www.linkedin.com/in/shreemanarjun/',
                  classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                  [Linkedin(height: 20.px, width: 20.px)],
                ),
                a(
                  href: 'https://twitter.com/shreemanarjun/',
                  classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                  [Twitter(height: 20.px, width: 20.px)],
                ),
                a(
                  href: 'mailto:shreemanarjunsahu@gmail.com',
                  classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                  [
                    Mail(height: 20.px, width: 20.px),
                  ],
                ),
              ]),

              // Mobile toggle
              button(
                events: {
                  'click': (_) {
                    final current = context.read(isMobileMenuOpenProvider);
                    context.read(isMobileMenuOpenProvider.notifier).state = !current;
                  },
                },
                classes: 'md:hidden text-white/80 hover:text-white transition-colors duration-300',
                [
                  isMobileMenuOpen ? X(height: 20.px, width: 20.px) : Menu(height: 20.px, width: 20.px),
                ],
              ),
            ]),

            // Mobile nav
            if (isMobileMenuOpen)
              div(
                classes: 'md:hidden mt-4 p-4 backdrop-blur-md bg-white/10 rounded-lg border border-white/20',
                [
                  for (var item in navItems)
                    button(
                      events: {
                        'click': (_) => scrollToSection(item.toLowerCase()),
                      },
                      classes: 'block w-full text-left py-2 text-white/80 hover:text-white transition-colors duration-300',
                      [text(item)],
                    ),
                  div(classes: 'flex space-x-4 mt-4 pt-4 border-t border-white/20', [
                    a(
                      href: 'https://github.com/Shreemanarjun',
                      classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                      [Github(height: 20.px, width: 20.px)],
                    ),
                    a(
                      href: 'https://www.linkedin.com/in/shreemanarjun/',
                      classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                      [Linkedin(height: 20.px, width: 20.px)],
                    ),
                    a(
                      href: 'https://twitter.com/shreemanarjun/',
                      classes: 'text-white/80 hover:text-white transition-colors duration-300 hover:scale-110 transform',
                      [Mail(height: 20.px, width: 20.px)],
                    ),
                  ]),
                ],
              ),
          ]),
        ],
      ),
    ]);
  }
}
