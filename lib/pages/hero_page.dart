import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Component, Router, Target;
import 'package:jaspr_router/jaspr_router.dart';
import 'package:paper_port/services/scroll_services.dart';
import 'package:universal_web/web.dart';

class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'hero',
      classes: "min-h-screen flex items-center justify-center px-6 pt-20",
      [
        div(
          classes: "max-w-4xl mx-auto",
          [
            div(
              classes: "space-y-8 text-center md:text-left",
              [
                _HeroStatus(),
                _HeroHeadline(),
                _HeroActions(),
                _HeroMetaInfo(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroStatus extends StatelessComponent {
  const _HeroStatus();

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "flex items-center justify-center md:justify-start space-x-2 text-sm text-gray-500 font-medium tracking-wider uppercase",
      [
        div(classes: "w-4 h-4 bg-green-500 rounded-full", []),
        span([text("Senior Flutter Developer")]),
      ],
    );
  }
}

class _HeroHeadline extends StatelessComponent {
  const _HeroHeadline();

  @override
  Component build(BuildContext acontext) {
    return div(
      classes: "space-y-6",
      [
        h1(
          classes: "text-6xl md:text-8xl font-light text-gray-900 leading-none tracking-tight",
          [text("Shreeman Arjun Sahu")],
        ),
        p(
          classes: "text-xl md:text-2xl text-gray-600 max-w-3xl leading-relaxed font-light",
          [
            text(
              "Crafting beautiful, performant cross-platform applications with Flutter and Dart for Android, iOS, Windows, and Web",
            ),
          ],
        ),
        p(
          classes: "text-lg text-gray-600 max-w-3xl leading-relaxed",
          [
            text(
              "Passionate about creating seamless user experiences across all platforms with a single codebase. Specializing in modern UI/UX design, scalable architecture, and cross-platform optimization.",
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroActions extends StatelessComponent {
  const _HeroActions();

  @override
  Component build(BuildContext context) {
    return div(
      classes: "flex flex-wrap gap-4 pt-8 justify-center md:justify-start",
      [
        button(
          events: events(onClick: () => ScrollService().scrollToSection('work')),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-blue-600 text-white transition-all duration-300 hover:bg-blue-700 border-2 border-transparent hover:border-blue-800",
          [
            Briefcase(height: 18.px, width: 18.px),
            span([text("View Work")]),
          ],
        ),
        button(
          events: events(
            onClick: () {
              Router.of(context).push('/cv');
            },
          ),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-gray-100 text-gray-800 transition-all duration-300 hover:bg-gray-200 border-2 border-transparent hover:border-gray-300",
          [
            FileText(height: 16.px, width: 16.px),
            span([text("View CV")]),
          ],
        ),

        button(
          events: events(
            onClick: () {
              window.open('https://www.youtube.com/@flutterexplorer', '_blank');
            },
          ),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-red-50 text-red-600 transition-all duration-300 hover:bg-red-100 border-2 border-transparent hover:border-red-200",
          [
            Youtube(
              height: 18.px,
              width: 18.px,
            ),
            span([text("YouTube")]),
            ArrowUpRight(
              height: 16.px,
              width: 16.px,
              classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
            ),
          ],
        ),
        button(
          events: events(
            onClick: () {
              window.open('https://github.com/sponsors/Shreemanarjun', '_blank');
            },
          ),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-pink-50 text-pink-700 transition-all duration-300 hover:bg-pink-100 border-2 border-transparent hover:border-pink-200",
          [
            Heart(
              height: 16.px,
              width: 16.px,
              styles: Styles(
                raw: {'fill': 'currentColor'},
              ),
            ),
            span([text("Sponsor")]),
          ],
        ),
        a(
          href: 'https://www.buymeacoffee.com/shreemanarjun',
          target: Target.blank,
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-amber-50 text-amber-700 transition-all duration-300 hover:bg-amber-100 border-2 border-transparent hover:border-amber-200",
          [
            Coffee(
              height: 18.px,
              width: 18.px,
            ),
            span([text("Buy me a coffee")]),
            ArrowUpRight(
              height: 16.px,
              width: 16.px,
              classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
            ),
          ],
        ),
        button(
          events: events(
            onClick: () {
              window.open('https://datum.shreeman.dev', '_blank');
            },
          ),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-purple-50 text-purple-700 transition-all duration-300 hover:bg-purple-100 border-2 border-transparent hover:border-purple-200",
          [
            Book(height: 16.px, width: 16.px),
            span([text("Datum Docs")]),
            ArrowUpRight(
              height: 16.px,
              width: 16.px,
              classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
            ),
          ],
        ),
        button(
          events: events(
            onClick: () {
              window.open('https://printing.shreeman.dev', '_blank');
            },
          ),
          classes:
              "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-teal-50 text-teal-700 transition-all duration-300 hover:bg-teal-100 border-2 border-transparent hover:border-teal-200",
          [
            Printer(height: 16.px, width: 16.px),
            span([text("Printing FFI Docs")]),
            ArrowUpRight(
              height: 16.px,
              width: 16.px,
              classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroMetaInfo extends StatelessComponent {
  const _HeroMetaInfo();

  @override
  Component build(BuildContext context) {
    return div(
      classes: "flex items-center justify-center md:justify-start space-x-6 pt-8",
      [
        div(classes: "flex items-center space-x-2 text-sm text-gray-600", [
          div(classes: "w-2 h-2 bg-green-500 rounded-full animate-pulse", []),
          span([text("Available for collaborations")]),
        ]),
        div(classes: "flex items-center space-x-2 text-sm text-gray-600", [
          MapPin(
            height: 14.px,
            width: 14.px,
          ),
          span([text("Bhubaneswar, India")]),
        ]),
      ],
    );
  }
}
