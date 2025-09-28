import 'package:jaspr/jaspr.dart';

class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  static const mobileSkills = ['Flutter', 'Dart', 'Android (Kotlin)', 'iOS (Swift)', 'React Native'];
  static const backendSkills = ['Firebase', 'Node.js', 'Python', 'Google Cloud', 'AWS'];
  static const advocacySkills = [
    'Technical Writing',
    'Public Speaking',
    'Community Building',
    'Content Creation',
    'Mentoring',
  ];

  @override
  Component build(BuildContext context) {
    return section(
      id: 'skills',
      classes: "py-32 px-6",
      [
        div(
          classes: "max-w-6xl mx-auto",
          [
            div(
              classes: "space-y-16",
              [
                div(
                  classes: "text-center space-y-4",
                  [
                    h2(classes: "text-4xl md:text-5xl font-light text-gray-900", [text("Expertise")]),
                    div(classes: "w-16 h-0.5 bg-gray-900 mx-auto", []),
                  ],
                ),
                div(
                  classes: "grid md:grid-cols-3 gap-12",
                  [
                    _buildSkillColumn("Mobile Development", mobileSkills),
                    _buildSkillColumn("Backend & Cloud", backendSkills),
                    _buildSkillColumn("Developer Advocacy", advocacySkills),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _buildSkillColumn(String title, List<String> skills) {
    return div(
      classes: "skill-section",
      [
        h3(
          classes: "text-xl font-medium text-gray-900 mb-6",
          [text(title)],
        ),
        ul(
          classes: "space-y-3",
          skills
              .map(
                (skill) => li(
                  classes: "skill-item group",
                  [text(skill)],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
