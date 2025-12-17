// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js_interop';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:paper_port/services/work_scroll_progress_provider.dart';
import 'package:universal_web/web.dart' as web;

import 'package:paper_port/pages/about_section_page.dart';
import 'package:paper_port/pages/contact_section.dart';
import 'package:paper_port/pages/footer.dart';
import 'package:paper_port/pages/hero_page.dart';
import 'package:paper_port/pages/nav.dart';
import 'package:paper_port/pages/skills_section.dart';
import 'package:paper_port/pages/work_section/work_section.dart';
import 'package:paper_port/services/scroll_services.dart';
import 'package:paper_port/services/visibilty_observer.dart';

final scrollProvider = NotifierProvider.autoDispose<ScrollNotifier, ScrollState>(
  ScrollNotifier.new,
  name: "scrollProvider",
);

class ScrollState {
  final double progress;
  const ScrollState({this.progress = 0.0});

  @override
  bool operator ==(covariant ScrollState other) {
    if (identical(this, other)) return true;

    return other.progress == progress;
  }

  @override
  int get hashCode => progress.hashCode;
}

class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Start listening to scroll events when the component is initialized.
    context.read(scrollProvider.notifier).init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return div(
      classes: "min-h-screen bg-gray-50 font-sans",
      [
        Builder(
          builder: (context) {
            context.watch(scrollProvider);
            return div([]);
          },
        ),
        CustomScrollbarWithSection(),
        CustomNav(),
        Hero(),
        AboutSection(),
        WorkSection(),
        SkillsSection(),
        ContactSection(),
        ScrollToTopButton(),
        Footer(),
      ],
    );
  }
}

class CustomScrollbarWithSection extends StatelessComponent {
  const CustomScrollbarWithSection();

  @override
  Component build(BuildContext context) {
    return div(
      classes: "fixed right-6 top-1/2 transform -translate-y-1/2 z-50 hidden lg:block",
      [
        div(
          classes: "relative",
          [
            ScrollProgressBar(),
          ],
        ),
      ],
    );
  }
}

class ScrollProgressBar extends StatelessComponent {
  const ScrollProgressBar({super.key});

  @override
  Component build(BuildContext context) {
    // Watch both the active section and the overall scroll progress.
    final activeSectionID = context.watch(activeSectionIDProvider);
    final activeSection = SectionIndicatorState.sections.firstWhere(
      (sss) => sss.id == activeSectionID,
      orElse: () => SectionIndicatorState.sections.first,
    );

    // Use the dedicated provider for 'work' section progress, otherwise use discrete section position.
    final double progressPercent;
    if (activeSection.id == 'work') {
      progressPercent = context.watch(workScrollProgressProvider);
    } else {
      progressPercent = activeSection.position / 100.0;
    }

    return div(
      // This is the gray background line, inset from top and bottom.
      classes: "relative w-1 h-80 bg-gray-200 rounded-full",
      [
        // This is the filled portion of the line.
        div(
          classes: "w-full bg-gray-900 rounded-full transition-height duration-300 ease-out",
          styles: Styles(raw: {'height': '${(progressPercent * 100).clamp(0, 100)}%'}),
          [],
        ),
        // The SectionIndicator is now a child, ensuring it's rendered on top.
        SectionIndicator(),
      ],
    );
  }
}

typedef SectionWithID = ({String id, String label, int position});

class SectionIndicator extends StatefulComponent {
  const SectionIndicator({super.key});

  @override
  State<SectionIndicator> createState() => SectionIndicatorState();
}

class SectionIndicatorState extends State<SectionIndicator> with VisibilityObserverMixin {
  bool _isDragging = false;
  web.EventListener? _mouseMoveListener;
  web.EventListener? _mouseUpListener;
  static const List<SectionWithID> sections = [
    (id: 'hero', label: 'Home', position: 0), // 'hero' is for the top of the page
    (id: 'about', label: 'About', position: 25),
    (id: 'work', label: 'Work', position: 50),
    (id: 'skills', label: 'Skills', position: 75),
    (id: 'contact', label: 'Contact', position: 100),
  ];

  @override
  void initState() {
    context.read(activeSectionIDProvider.notifier).state = ''; // Initialize as empty to prevent flicker
    super.initState();
    context.binding.addPostFrameCallback(
      () {
        observeSections(
          sections
              .map(
                (e) => e.id,
              )
              .toList(),
          (visibleSectionId) {
            var newActiveId = visibleSectionId;
            // If no section is actively in view, check if we're at the bottom of the page.
            // This makes the indicator "stick" to the 'Contact' section.
            if (newActiveId.isEmpty) {
              final scrollY = web.window.scrollY.toDouble();
              final totalHeight = web.document.body?.scrollHeight.toDouble() ?? 0;
              final viewHeight = web.window.innerHeight.toDouble();
              // Check if scrolled to the bottom (with a 5px buffer)
              if (totalHeight > 0 && scrollY + viewHeight >= totalHeight - 5) {
                newActiveId = sections.last.id;
              }
            }
            context.read(activeSectionIDProvider.notifier).state = newActiveId;
          },
        );
      },
    );
  }

  void _onDrag(web.MouseEvent event) {
    if (!_isDragging) return;

    final parent = (event.currentTarget as web.Element).parentElement;
    if (parent == null) return;

    final rect = parent.getBoundingClientRect();
    final y = event.clientY - rect.top;
    final progress = (y / rect.height).clamp(0.0, 1.0);

    final totalHeight = web.document.body?.scrollHeight ?? 0;
    final viewHeight = web.window.innerHeight;
    final scrollableHeight = totalHeight - viewHeight;

    web.window.scrollTo(web.ScrollToOptions(top: scrollableHeight * progress, behavior: 'auto'));
  }

  @override
  void dispose() {
    if (_mouseMoveListener != null) {
      web.window.removeEventListener('mousemove', _mouseMoveListener);
    }
    if (_mouseUpListener != null) {
      web.window.removeEventListener('mouseup', _mouseUpListener);
    }
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return nav(
      classes: "absolute inset-0 cursor-pointer",
      events: {
        "onMouseDown": (event) {
          if (event.isA<web.MouseEvent>()) {
            setState(() => _isDragging = true);

            _mouseMoveListener = ((web.MouseEvent e) {
              _onDrag(e);
            }).toJS;
            _mouseUpListener = ((web.MouseEvent e) {
              setState(() => _isDragging = false);
              if (_mouseMoveListener != null) {
                web.window.removeEventListener('mousemove', _mouseMoveListener!);
              }
              if (_mouseUpListener != null) {
                web.window.removeEventListener('mouseup', _mouseUpListener!);
              }
            }).toJS;

            web.window.addEventListener('mousemove', _mouseMoveListener);
            web.window.addEventListener('mouseup', _mouseUpListener);

            // Trigger for initial click, using the native browser event.
            _onDrag(event as web.MouseEvent);
          }
        },
      },
      [
        ...() {
          final activeSectionID = context.watch(activeSectionIDProvider);
          final workProgressPercent = context.watch(workScrollProgressProvider) * 100;

          return sections.map((csection) {
            final activeSection = sections.firstWhere((ss) => ss.id == activeSectionID, orElse: () => sections.first);
            final isPassed = csection.position <= activeSection.position;
            final isActive = csection.id == activeSectionID;

            // Determine the vertical position of the indicator dot.
            double topPositionPercent;
            if (isActive && csection.id == 'work') {
              // If the 'work' section is active, use the granular, continuous progress.
              final workSectionDef = sections.firstWhere((ss) => ss.id == 'work');
              final skillsSectionDef = sections.firstWhere((ss) => ss.id == 'skills');
              topPositionPercent = workProgressPercent.clamp(
                workSectionDef.position.toDouble(),
                skillsSectionDef.position.toDouble(),
              );
            } else {
              // Otherwise, use the fixed position for the section.
              topPositionPercent = csection.position.toDouble();
            }

            return div(
              classes: "absolute group w-full",
              styles: Styles(
                transform: Transform.translate(y: (-50).percent),
                raw: {'top': "$topPositionPercent%"},
              ),
              [
                // Container for the dot and its highlight ring.
                div(
                  classes: "absolute left-1/2 -translate-x-1/2 w-6 h-6",
                  [
                    // The highlight ring, visible only when the section is active.
                    div(
                      classes:
                          "absolute inset-0 rounded-full ring-2 ring-gray-900 transition-opacity duration-300 ${isActive ? 'opacity-100' : 'opacity-0'}",
                      [],
                    ),
                    // The clickable dot.
                    button(
                      events: events(onClick: () => ScrollService().scrollToSection(csection.id)),
                      classes:
                          "absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-4 h-4 rounded-full border-2 transition-all duration-300 ${isPassed ? 'bg-gray-900 border-gray-900' : 'bg-transparent border-gray-400'}",
                      [],
                    ),
                  ],
                ),
                // Tooltip that appears on hover.
                div(
                  classes: [
                    "absolute right-8 top-1/2 transform -translate-y-1/2 transition-opacity duration-200 pointer-events-none",
                    isActive ? "opacity-100" : "opacity-0 group-hover:opacity-100",
                  ].join(' '),
                  [
                    div(
                      classes: "bg-gray-900 text-white px-3 py-1 rounded-md text-sm font-medium whitespace-nowrap",
                      [Component.text(csection.label)],
                    ),
                    div(
                      classes:
                          "absolute left-full top-1/2 transform -translate-y-1/2 -translate-x-1 w-0 h-0 border-l-4 border-l-gray-900 border-t-2 border-b-2 border-t-transparent border-b-transparent",
                      [],
                    ),
                  ],
                ),
              ],
            );
          });
        }(),
      ],
    );
  }
}

class ScrollToTopButton extends StatelessComponent {
  const ScrollToTopButton({super.key});

  @override
  Component build(BuildContext context) {
    // Watch the scroll provider to determine visibility.
    final scrollProgress = context.watch(scrollProvider.select((ss) => ss.progress));

    // Show the button only after scrolling down 20% of the page.
    final isVisible = scrollProgress > 0.1;

    return button(
      classes: [
        "fixed bottom-8 right-8 z-50 p-3 rounded-full bg-gray-900 text-white shadow-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition-all duration-300",
        // Apply classes for a smooth fade-in/slide-up animation.
        isVisible ? "opacity-100 translate-y-0" : "opacity-0 translate-y-10 pointer-events-none",
      ].join(' '),
      events: events(
        onClick: () {
          // Use the browser's native smooth scroll behavior to go to the top.
          web.window.scrollTo(web.ScrollToOptions(top: 0, behavior: 'smooth'));
        },
      ),
      [
        // SVG icon for an upward-pointing arrow.
        svg(
          attributes: {
            'xmlns': 'http://www.w3.org/2000/svg',
            'class': 'h-6 w-6',
            'fill': 'none',
            'viewBox': '0 0 24 24',
            'stroke': 'currentColor',
            'stroke-width': '2',
          },
          [
            path(attributes: {'stroke-linecap': 'round', 'stroke-linejoin': 'round', 'd': 'M5 15l7-7 7 7'}, []),
          ],
        ),
      ],
    );
  }
}

class ScrollNotifier extends Notifier<ScrollState> {
  ScrollNotifier() : super();

  JSFunction? _scrollListener;

  @override
  ScrollState build() {
    ref.onDispose(
      () {
        if (_scrollListener != null) {
          web.window.removeEventListener('scroll', _scrollListener);
          _scrollListener = null;
        }
      },
    );
    return const ScrollState();
  }

  void init() {
    void dartListener(web.Event event) {
      final totalHeight = web.document.body?.scrollHeight ?? 0;
      final viewHeight = web.window.innerHeight;
      final scrollableHeight = totalHeight - viewHeight;
      final scrollY = web.window.scrollY;

      if (scrollableHeight > 0) {
        final progress = (scrollY / scrollableHeight).clamp(0.0, 1.0);
        if (state.progress != progress) {
          state = ScrollState(progress: progress);
        }
      } else {
        state = const ScrollState(progress: 0.0);
      }
    }

    _scrollListener = dartListener.toJS;
    web.window.addEventListener('scroll', _scrollListener);
    // Initial calculation
    dartListener(web.Event(''));
  }
}
