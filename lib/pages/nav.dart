import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Component, Target;
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import 'package:paper_port/services/scroll_services.dart';

final isMenuOpenProvider = StateProvider.autoDispose<bool>(
  (ref) {
    return false;
  },
  name: "isMenuOpenProvider",
);

final activeSectionIDProvider = StateProvider.autoDispose<String>(
  (ref) {
    return "";
  },
  name: "activeSectionIDProvider",
);

class CustomNav extends StatefulComponent {
  const CustomNav({super.key});
  // Define sections with their corresponding IDs for navigation.
  // It now supports in-page scrolling (using `id`) and external links (using `href`).
  static const sections = <({String label, String? id, String? href})>[
    (label: 'About', id: 'about', href: null),
    (label: 'Work', id: 'work', href: null),
    (label: 'Skills', id: 'skills', href: null),
    (label: 'Contact', id: 'contact', href: null),
    (label: 'Blogs', id: null, href: 'https://blogs.shreeman.dev'),
    (label: 'Packages', id: null, href: 'https://pub.dev/publishers/shreeman.dev/packages'),
  ];

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  Iterable<Component> _buildNavLinks(
    BuildContext context, {
    required String defaultClasses,
    bool isMobile = false,
  }) {
    return CustomNav.sections.map(
      (sectionData) {
        final id = sectionData.id;
        final href = sectionData.href;

        if (href != null) {
          // This is a hyperlink to another site.
          return a(
            href: href,
            target: Target.blank, // Open in a new tab
            classes: [
              "text-gray-600",
              defaultClasses,
            ].join(' '),
            [text(sectionData.label)],
          );
        } else if (id != null) {
          // This is an in-page scroll link.
          return button(
            events: events(
              onClick: () {
                ScrollService().scrollToSection(id);
                if (isMobile) {
                  context.read(isMenuOpenProvider.notifier).state = false;
                }
              },
            ),
            classes: [
              context.watch(activeSectionIDProvider.select((activeId) => activeId == id))
                  ? "text-gray-900 font-semibold"
                  : "text-gray-600",
              defaultClasses,
              "cursor-pointer",
            ].join(' '),
            [text(sectionData.label)],
          );
        }
        // Return an empty component if neither id nor href is provided.
        return text('');
      },
    );
  }

  @override
  Component build(BuildContext context) {
    return nav(
      classes: "fixed top-0 w-full bg-white/80 backdrop-blur-md z-50 border-b border-gray-100",
      [
        div(
          classes: "max-w-6xl mx-auto px-6 py-4 flex justify-between items-center",
          [
            LogoComponent(),

            ///Desktop Navigation
            div(classes: "hidden md:flex space-x-8", [
              ..._buildNavLinks(
                context,
                defaultClasses: "hover:text-gray-900 transition-colors capitalize text-sm font-medium tracking-wide",
              ),
            ]),

            /// Mobile Navigation Toggle
            button(
              classes: "md:hidden p-2 text-gray-600 hover:text-gray-900",
              events: events(
                onClick: () {
                  context
                      .read(isMenuOpenProvider.notifier)
                      .update(
                        (state) => !state,
                      );
                },
              ),
              [
                Builder(
                  builder: (context) {
                    final isMenuOpen = context.watch(isMenuOpenProvider);
                    if (isMenuOpen) {
                      return X(
                        height: 20.px,
                        width: 20.px,
                      );
                    } else {
                      return Menu(
                        height: 20.px,
                        width: 20.px,
                      );
                    }
                  },
                ),
              ],
            ),

            /// Mobile Navigation Menu
            Builder(
              builder: (context) {
                final isMenuOpen = context.watch(isMenuOpenProvider);
                // Use explicit classes for showing/hiding the mobile menu.
                // It's hidden on medium+ screens regardless.
                return div(
                  classes:
                      '${isMenuOpen ? "block" : "hidden"} md:hidden absolute top-full left-0 w-full bg-white/95 backdrop-blur-md border-t border-gray-100',
                  [
                    div(classes: "px-6 py-4 space-y-4", [
                      ..._buildNavLinks(
                        context,
                        defaultClasses: "block w-full text-left capitalize py-2",
                        isMobile: true,
                      ),
                    ]),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class LogoComponent extends StatelessComponent {
  const LogoComponent({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'flex flex-col items-start',
      [
        a(
          href: '/',
          classes: 'text-xl font-bold text-transparent bg-gradient-to-r from-blue-500 to-purple-600 bg-clip-text',
          [
            text('shreeman.dev'),
          ],
        ),
        a(
          href: "https://jaspr.site/",
          target: Target.blank,
          classes:
              'mt-1 flex items-center space-x-1 animate-fade-up text-xs font-semibold text-gray-500 hover:text-gray-800 transition-colors',
          [
            text('Made with Jaspr'),
            img(
              src: 'images/logo.svg',
              alt: 'Jaspr logo',
              styles: Styles(
                width: 16.px,
                height: 16.px,
                margin: Spacing.only(left: 4.px),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @css
  static final styles = [
    css.keyframes('fade-up', {
      '0%': Styles(
        opacity: 0,
        transform: Transform.translate(y: 10.px),
      ),
      '100%': Styles(
        opacity: 1,
        transform: Transform.translate(y: 0.px),
      ),
    }),
  ];
}
