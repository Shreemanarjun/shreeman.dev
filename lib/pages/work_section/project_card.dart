import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart';
import 'package:paper_port/pages/work_section/platform_links.dart';
import 'package:paper_port/pages/work_section/project.dart';
import 'package:paper_port/pages/work_section/star_rating.dart';

/// A component to display a single project card.
class ProjectCard extends StatelessComponent {
  const ProjectCard({required this.project});

  final Project project;

  @override
  Component build(BuildContext context) {
    final infoItems = <Component>[];

    if (project.rating > 0) {
      infoItems.add(StarRating(rating: project.rating));
    }

    if (project.downloads.isNotEmpty) {
      if (infoItems.isNotEmpty) {
        infoItems.add(div(classes: "w-1 h-1 bg-gray-300 rounded-full", []));
      }
      infoItems.add(Component.text(project.downloads));
    }

    final cardContent = div(
      // Added bg-white, a default shadow-lg, and enhanced the hover shadow to shadow-2xl for better elevation and card feel.
      classes:
          "project-card group bg-white p-6 lg:p-8 rounded-lg transition-all duration-300 shadow-lg hover:shadow-2xl hover:-translate-y-2 mb-12",
      [
        div(
          // On large screens, arrange horizontally with a larger gap.
          classes: "flex flex-col lg:flex-row lg:items-center justify-between gap-y-4 lg:gap-8",
          [
            div(
              classes: "flex-1 space-y-4",
              [
                if (infoItems.isNotEmpty) // Only render if there's info to show
                  div(
                    classes: "flex items-center flex-wrap gap-x-4 gap-y-2 text-sm text-gray-500",
                    infoItems,
                  ),
                div(
                  classes: "text-2xl font-medium text-gray-900 group-hover:text-gray-600 transition-colors",
                  [Component.text(project.title)],
                ),
                p(
                  classes: "text-gray-600 leading-relaxed max-w-2xl",
                  [Component.text(project.description)],
                ),
                if (project.keyFeatures.isNotEmpty)
                  ul(
                    classes: "space-y-2",
                    project.keyFeatures.map((feature) {
                      return li(
                        classes: "flex items-start text-gray-600",
                        [
                          Check(
                            height: 18.px,
                            width: 18.px,
                            classes: "mr-3 mt-0.5 flex-shrink-0 text-green-500",
                          ),
                          span([Component.text(feature)]),
                        ],
                      );
                    }).toList(),
                  ),
                div(
                  classes: "flex flex-wrap items-center gap-x-3 gap-y-2 text-sm text-gray-600",
                  [
                    ...() {
                      final techWidgets = <Component>[];
                      for (var i = 0; i < project.tech.length; i++) {
                        techWidgets.add(Component.text(project.tech[i]));
                        if (i < project.tech.length - 1) {
                          techWidgets.add(
                            span(classes: "w-1 h-1 bg-gray-400 rounded-full", []),
                          );
                        }
                      }
                      return techWidgets;
                    }(),
                  ],
                ),
              ],
            ),
            PlatformLinks(project: project),
          ],
        ),
      ],
    );
    return cardContent;
  }
}
