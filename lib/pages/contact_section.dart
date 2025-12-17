import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Target;

typedef SocialLink = ({Component icon, String name, String url});

final socialLinks = <SocialLink>[
  (icon: Github(height: 20.px, width: 20.px), name: 'GitHub', url: 'https://github.com/Shreemanarjun'),
  (icon: Linkedin(height: 20.px, width: 20.px), name: 'LinkedIn', url: 'https://www.linkedin.com/in/shreemanarjun/'),
  (icon: Twitter(height: 20.px, width: 20.px), name: 'Twitter', url: 'https://twitter.com/shreemanarjun'),
  (icon: Mail(height: 20.px, width: 20.px), name: 'Mail', url: 'mailto:shreemanarjunsahu@gmail.com'),
];

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'contact',
      classes: "py-32 px-6 bg-white",
      [
        div(
          classes: "max-w-4xl mx-auto text-center",
          [
            div(
              classes: "space-y-12",
              [
                div(
                  classes: "space-y-6",
                  [
                    h2(classes: "text-4xl md:text-5xl font-light text-gray-900", [Component.text("Let's collaborate")]),
                    p(
                      classes: "text-xl text-gray-600 max-w-2xl mx-auto leading-relaxed",
                      [
                        Component.text(
                          "Always interested in new opportunities, speaking engagements, and collaborative projects that push the boundaries of mobile development.",
                        ),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "flex flex-col sm:flex-row gap-4 justify-center",
                  [
                    a(
                      href: "mailto:shreemanarjunsahu@gmail.com",
                      classes:
                          "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-gray-900 text-white transition-colors hover:bg-gray-800",

                      [
                        // Mail Icon
                        Mail(height: 18.px, width: 18.px),
                        span([Component.text("Get in touch")]),
                        // Arrow Icon
                        ArrowUpRight(
                          height: 16.px,
                          width: 16.px,
                          classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
                        ),
                      ],
                    ),
                    // a(
                    //   href: "",
                    //   classes:
                    //       "group flex items-center justify-center gap-2 px-6 py-3 rounded-lg font-medium bg-gray-100 text-gray-900 transition-colors hover:bg-gray-200",
                    //   [
                    //     // Phone Icon
                    //     Phone(height: 18.px, width: 18.px),
                    //     span([text("Schedule a call")]),
                    //     // Arrow Icon
                    //     ArrowUpRight(
                    //       height: 16.px,
                    //       width: 16.px,
                    //       classes: "group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform",
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                div(
                  classes: "flex justify-center space-x-6 pt-8",
                  socialLinks.map((clink) => _buildSocialLink(clink.icon, clink.url)).toList(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _buildSocialLink(Component icon, String url) {
    return a(
      href: url,
      target: Target.blank,
      attributes: {'aria-label': 'Visit my profile'},
      classes: "p-3 bg-gray-100 rounded-full text-gray-600 hover:bg-gray-200 hover:text-gray-900 transition-colors",
      [icon],
    );
  }
}
