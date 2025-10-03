import 'package:jaspr/jaspr.dart';
import 'package:paper_port/pages/work_section/deploy.dart';
import 'package:paper_port/pages/work_section/project.dart';

class PlatformLinks extends StatelessComponent {
  final Project project;
  const PlatformLinks({
    super.key,
    required this.project,
  });

  @override
  Component build(BuildContext context) {
    return div(
      id: "Paltform Links",
      classes: "flex items-center flex-wrap gap-x-4 gap-y-2 text-sm text-gray-500",
      [
        ...project.platforms.map((platform) {
          String? iconPath = switch (platform) {
            null => throw UnimplementedError(),
            AndroidDeploy() => 'https://img.icons8.com/?size=100&id=P2AnGyiJxMpp&format=png&color=000000',
            IosDeploy() => 'https://img.icons8.com/?size=100&id=6TVjszwqlYOz&format=png&color=000000',
            WebDeploy() => 'https://img.icons8.com/?size=100&id=Hh1B7BSHLkhc&format=png&color=000000',
            LinuxDeploy() => "https://img.icons8.com/?size=100&id=17842&format=png&color=000000",
            WindowsDeploy() => "https://img.icons8.com/?size=100&id=undefined&format=png&color=000000",
            MacOsDeploy() => "https://img.icons8.com/?size=100&id=17843&format=png&color=000000",
            OtherDeploy() => "https://img.icons8.com/?size=100&id=12312&format=png&color=000000",
            PubDeploy() => "https://img.icons8.com/?size=100&id=7AFcZ2zirX6Y&format=png&color=000000",
          };

          return a(href: platform.url ?? "", target: Target.blank, [
            img(
              src: iconPath,
              alt: platform.name,
              styles: Styles(width: 24.px, height: 24.px),
            ),
          ]);
        }),
      ],
    );
  }
}
