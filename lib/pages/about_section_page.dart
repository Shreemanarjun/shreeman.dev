import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart';

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      id: 'about',
      classes: "py-32 px-6 bg-gray-50",
      [
        div(
          classes: "max-w-6xl mx-auto",
          [
            div(
              classes: "grid grid-cols-1 lg:grid-cols-3 gap-16 items-start",
              [
                // Left side: Main content
                div(
                  classes: "lg:col-span-2 space-y-8",
                  [
                    div(
                      classes: "space-y-4",
                      [
                        h2(classes: "text-4xl md:text-5xl font-light text-gray-900", [Component.text("About Me")]),
                        div(classes: "w-16 h-0.5 bg-gray-900", []),
                      ],
                    ),
                    p(
                      classes: "text-lg text-gray-600 leading-relaxed",
                      [
                        Component.text(
                          "I'm a passionate Flutter developer with 3+ years of experience building high-quality mobile applications. I love turning ideas into beautiful, functional apps that users enjoy.",
                        ),
                      ],
                    ),
                    div(
                      classes: "space-y-4",
                      [
                        h3(classes: "text-2xl font-medium text-gray-800", [Component.text("My Journey")]),
                        p(
                          classes: "text-lg text-gray-600 leading-relaxed",
                          [
                            Component.text(
                              "Started my development journey with native Android and iOS development, then discovered Flutter and fell in love with its efficiency and cross-platform capabilities.",
                            ),
                          ],
                        ),
                        p(
                          classes: "text-lg text-gray-600 leading-relaxed",
                          [
                            Component.text(
                              "I've worked on various projects ranging from e-commerce apps to productivity tools across Android, iOS, Windows, and Web platforms, always focusing on creating exceptional user experiences with clean, maintainable code.",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                // Right side: Key Achievements
                div(
                  classes: "space-y-6 p-8 bg-white rounded-lg shadow-sm border border-gray-100",
                  [
                    h3(classes: "text-2xl font-medium text-gray-800", [Component.text("Key Achievements")]),
                    ul(
                      classes: "space-y-3 text-gray-600",
                      [
                        li(classes: "flex items-start gap-3", [
                          BadgeCheck(
                            height: 20.px,
                            width: 20.px,
                            classes: "mt-1 flex-shrink-0",
                            styles: Styles(color: Color("#10B981")),
                          ),
                          span([Component.text("15+ cross-platform applications deployed")]),
                        ]),
                        li(classes: "flex items-start gap-3", [
                          BadgeCheck(
                            height: 20.px,
                            width: 20.px,
                            classes: "mt-1 flex-shrink-0",
                            styles: Styles(color: Color("#10B981")),
                          ),
                          span([Component.text("1M+ combined app downloads")]),
                        ]),
                        li(classes: "flex items-start gap-3", [
                          BadgeCheck(
                            height: 20.px,
                            width: 20.px,
                            classes: "mt-1 flex-shrink-0",
                            styles: Styles(color: Color("#10B981")),
                          ),
                          span([Component.text("Expertise in state management (Bloc, Provider, Riverpod)")]),
                        ]),
                        li(classes: "flex items-start gap-3", [
                          BadgeCheck(
                            height: 20.px,
                            width: 20.px,
                            classes: "mt-1 flex-shrink-0",
                            styles: Styles(color: Color("#10B981")),
                          ),
                          span([Component.text("Firebase & cloud services integration specialist")]),
                        ]),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            // Bottom section: Core principles
            div(
              classes: "mt-24 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 text-center",
              [
                _buildPrincipleCard(
                  icon: Code(height: 28.px, width: 28.px),
                  title: "Clean Code",
                  description: "Writing maintainable, scalable code following best practices and design patterns.",
                ),
                _buildPrincipleCard(
                  icon: Smartphone(height: 28.px, width: 28.px),
                  title: "Cross-Platform",
                  description: "Single codebase for both iOS and Android with native performance.",
                ),
                _buildPrincipleCard(
                  icon: Palette(height: 28.px, width: 28.px),
                  title: "Modern UI",
                  description: "Creating beautiful, responsive interfaces with Material Design and Cupertino.",
                ),
                _buildPrincipleCard(
                  icon: Zap(height: 28.px, width: 28.px),
                  title: "Performance",
                  description: "Optimizing apps for speed, efficiency, and excellent user experience.",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _buildPrincipleCard({required Component icon, required String title, required String description}) {
    return div(
      classes: "space-y-3 p-6",
      [
        div(
          classes: "flex items-center justify-center w-16 h-16 mx-auto bg-gray-100 rounded-full text-gray-700",
          [icon],
        ),
        h4(classes: "text-xl font-semibold text-gray-800", [Component.text(title)]),
        p(classes: "text-gray-500", [Component.text(description)]),
      ],
    );
  }
}
