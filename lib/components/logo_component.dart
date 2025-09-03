import 'package:jaspr/jaspr.dart';

class LogoComponent extends StatelessComponent {
  const LogoComponent({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'p-2 relative flex flex-col items-start text-2xl font-bold text-transparent bg-gradient-to-r from-blue-400 to-purple-600 bg-clip-text',
      [
        a(
          href: 'https://shreeman.dev',
          [
            text(
              'shreeman.dev',
            ),
          ],
        ),

        a(
          href: "https://jaspr.site/",
          classes: 'mt-1 flex flex-row items-center space-x-6 space-y-6 animate-fade-up text-sm font-semibold text-white/60',
          onClick: () {},
          [
            text('Made with Jaspr'),
            // Added 'ml-2' class to the image for a small left margin
            img(src: 'images/logo.svg', width: 20, height: 20, classes: 'ml-2'),
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
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
